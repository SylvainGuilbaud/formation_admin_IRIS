Class APP.transform.ClairePatient Extends Ens.DataTransformDTL [ DependsOn = (Claire.RM.Patient.Record, HS.FHIR.DTL.vR4.Model.Resource.Patient) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Claire.RM.Patient.Record' targetClass='HS.FHIR.DTL.vR4.Model.Resource.Patient' create='new' language='objectscript' >
<assign value='source.id' property='target.id' action='set' />
<assign value='source.nom _ " " _ source.prenom' property='target.name.(1).family ' action='set' />
<assign value='source.prenom' property='target.name.(1).given.(1)' action='set' />
<assign value='"official"' property='target.name.(1).use' action='set' />
<assign value='source.nom_"CLAIRE"' property='target.name.(2).family' action='set' />
<assign value='"marital"' property='target.name.(2).use' action='set' />
</transform>
}

}
