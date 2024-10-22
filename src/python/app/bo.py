import os
import json
import requests
from liquid import FileExtensionLoader
from fhir_converter.renderers import Hl7v2Renderer, make_environment, hl7v2_default_loader

from iop import BusinessOperation

from msg import FhirConverterMessage, FhirConverterResponse, FhirRequest, FhirResponse

class FhirConverterOperation(BusinessOperation):
    def on_init(self):
        if not hasattr(self, 'template_path'):
            self.template_path = '/irisdev/app/templates'

        # create a renderer for the input data type
        self.renderer = Hl7v2Renderer(
            env=make_environment(
                loader=FileExtensionLoader(search_path=self.template_path),
                additional_loaders=[hl7v2_default_loader],
            )
    )

    def on_fhir_converter_message(self, request: FhirConverterMessage):
        # render the input data
        output_data = self.renderer.render_fhir_string(request.root_template, request.input_data)
        # create a FhirConverterResponse object
        fcr = FhirConverterResponse(
            status=200,
            output_data=output_data,
            output_filename=request.input_filename.replace('.hl7', '.json')
        )
        return fcr


class FhirConverterRestOperation(BusinessOperation):
    def on_init(self):
        if not hasattr(self, 'fhir_converter_url'):
            self.fhir_converter_url = 'http://localhost:5001/convertToFhir?api-version=2024-05-01-preview'

        # create a session
        self.session = requests.Session()


    def on_fhir_converter_message(self, request: FhirConverterMessage):
        json_data = {

                    "InputDataString": request.input_data,

                    "InputDataFormat": request.input_data_type,

                    "RootTemplateName": request.root_template,

            }
        payload = json.dumps(json_data,ensure_ascii=False)
        self.log_info(payload)
        # send the request to the FhirConverter service
        response = self.session.post(
            self.fhir_converter_url,
            headers={'Content-Type': 'application/json'},
            data=payload,
            timeout=10
        )

        # create a FhirConverterResponse object
        fcr = FhirConverterResponse(
            status=response.status_code,
            output_data=response.text,
            output_filename=''
        )
        return fcr
    
class FileOperation(BusinessOperation):
    def on_init(self):
        if not hasattr(self, 'output_path'):
            self.output_path = '/irisdev/app/data/output'

    def on_file_operation_message(self, request: FhirConverterResponse):
        # write the output data to a file
        with open(os.path.join(self.output_path, request.output_filename), 'w', encoding='utf-8') as f:
            f.write(request.output_data)


class FhirHttpOperation(BusinessOperation):

    def on_init(self):
        if not hasattr(self, 'url'):
            self.url = 'https://webgatewayfhir/fhir/r5'
        if not hasattr(self, 'credential'):
            self.credential = 'SuperUser'

        self.session = requests.Session()
        self.session.auth = self._get_credentials()

    def _get_credentials(self) -> tuple:
        if self.credential == 'SuperUser':
            return ('SuperUser', 'SYS')
        else:
            return ('', '')
        
    def on_fhir_request(self, msg: FhirRequest):
        uri = msg.url or self.url
        uri = uri.rstrip('/') + '/' + msg.resource
        response = self.session.request(
            method=msg.method,
            url=uri,
            data=msg.data,
            headers=msg.headers,
            timeout=10,
            verify=False
        )
        return FhirResponse(
            status_code=response.status_code,
            content=response.text,
            headers=response.headers,
            resource=msg.resource
        )