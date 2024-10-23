Class APP.transform.demo Extends Ens.DataTransformDTL [ DependsOn = APP.demo.patient.Record ]
{

/// DTL Definition.
XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform targetClass='APP.demo.patient.Record' targetDocType='' sourceClass='APP.demo.patient.Record' sourceDocType='' create='new' language='objectscript'>
</transform>
}

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

}
