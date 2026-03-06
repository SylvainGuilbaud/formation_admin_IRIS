Class IRISAPP.transfo.sqltofhir.Bundle Extends Ens.DataTransformDTL [ DependsOn = (msg.response.bundle, HS.FHIR.DTL.vR4.Model.Resource.Bundle) ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='msg.response.bundle' targetClass='HS.FHIR.DTL.vR4.Model.Resource.Bundle' create='new' language='python' >
<assign value='"Bundle"' property='target.type' action='set' />
<assign value='1' property='key' action='set' />
<subtransform class='IRISAPP.transfo.sqltofhir.Patient' targetObj='target.entry.(key)' sourceObj='source.patient' />
<foreach property='source.medications()' key='k1' >
<assign value='key+1' property='key' action='set' />
<subtransform class='IRISAPP.transfo.sqltofhir.MedicationRequest' targetObj='target.entry.(key)' sourceObj='source.medications.(k1)' />
</foreach>
</transform>
}

}
