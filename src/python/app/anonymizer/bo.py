import json
from jsonpath_ng import parse
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from iop import BusinessOperation
from msg import FhirConverterMessage, FhirConverterResponse

from anonymizer import fhir_anonymizer, model
from anonymizer.fhir_anonymizer import rules, anonymizers

class FhirConverterAnonymizeOperation(BusinessOperation):
    def on_init(self):
        self.engine = create_engine('iris+emb:///')
        model.Base.metadata.create_all(self.engine)
        self.session = sessionmaker(bind=self.engine)
        self.json_exp = parse('$.identifier[*].value')
    
    def on_fhir_converter_message(self, request: FhirConverterMessage):
        fhir_data = json.loads(request.input_data)

        for entry in fhir_data["entry"]:
            resource = entry["resource"]
            resource_id_list = self.json_exp.find(resource)

            for rule in rules.rules:
                fhir_anonymizer.anonymize_fhir_data(resource, rule)

            for resource_id in resource_id_list:
                anonymized_identifiable = model.AnonymizedIdentifiable(
                    resource_type=resource.get('resourceType'),
                    resource_id=resource_id.value,
                    resource_id_anonymized=anonymizers.hash_string()(resource_id.value, None, None)
                )
                with self.session() as session:
                    if session.query(model.AnonymizedIdentifiable).filter_by(resource_id=anonymized_identifiable.resource_id, resource_type = resource.get('resourceType')).first() is None:
                        session.add(anonymized_identifiable)
                    else:
                        session.query(model.AnonymizedIdentifiable).filter_by(resource_id=anonymized_identifiable.resource_id, resource_type = resource.get('resourceType')).update({'resource_id_anonymized': anonymized_identifiable.resource_id_anonymized})
                    session.commit()


        return FhirConverterResponse(
            output_data=json.dumps(fhir_data),
            status='OK',
            output_filename=request.input_filename.replace('.hl7', '.anonymize.json')
        )


