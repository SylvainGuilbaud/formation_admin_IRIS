from bp_simple import FhirConverterSimpleProcess

from msg import FhirConverterMessage

import os

class TestFhirConverterSimpleProcess:

    def test_on_fhir_converter_message(self):
        fhir_converter_simple_process = FhirConverterSimpleProcess()
        fhir_converter_simple_process.on_init()

        with open(os.path.join(os.path.dirname(__file__), 'data', 'ADT_fr.hl7'), 'r', encoding='utf-8') as f:
            body = f.read()

        request = FhirConverterMessage(
            input_filename='input_filename',
            input_data=body,
            input_data_type='Hl7v2',
            root_template='ADT_A01'
        )
        response = fhir_converter_simple_process.on_fhir_converter_message(request)
        assert response.output_filename == 'input_filename.simple.json'
