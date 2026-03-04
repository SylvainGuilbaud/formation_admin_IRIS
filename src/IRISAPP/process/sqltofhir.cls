/// 
Class IRISAPP.process.sqltofhir Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.request.patient' response='msg.response.patientFHIR' height='2000' width='2000' >
<context>
<property name='sql' type='msg.response.patient' instantiate='0' deletewithcontext='0' />
<property name='patientResource' type='HS.FHIR.DTL.vR4.Model.Resource.Patient' instantiate='0' deletewithcontext='0' />
</context>
<sequence xend='200' yend='900' >
<call name='get patient data' target='dw' async='0' xpos='200' ypos='250' >
<request type='msg.request.patient' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='msg.response.patient' >
<assign property="context.sql" value="callresponse" action="set" />
<assign property="response.&quot;first_name&quot;" value="callresponse.&quot;first_name&quot;" action="set" />
<assign property="response.&quot;last_name&quot;" value="callresponse.&quot;last_name&quot;" action="set" />
<assign property="response.id" value="callresponse.id" action="set" />
</response>
</call>
<switch name='sql | fhir' xpos='200' ypos='350' xend='200' yend='800' >
<case condition='request.format="sql"' name='sql' />
<case condition='request.format="sql"' name='sql' />
<case condition='request.format="sql"' name='sql' >
<empty xpos='335' ypos='500' />
</case>
<case condition='request.format="fhir"' >
<transform name='sql to fhir Patient' class='IRISAPP.transfo.sqltofhir' source='context.sql' target='context.patientResource' xpos='605' ypos='500' />
<assign name="patientResource" property="response.fhir" value="context.patientResource.ToJSON().Read()" action="set" xpos='605' ypos='600' />
</case>
<default/>
</switch>
</sequence>
</process>
}

}
