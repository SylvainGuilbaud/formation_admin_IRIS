/// Process to transform SQL data into FHIR resources
Class IRISAPP.process.sqltofhir Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.request.patient' response='msg.response.bundle' height='2000' width='2000' >
<context>
<property name='patient' type='msg.response.patient' instantiate='0' deletewithcontext='0' />
<property name='bundle' type='HS.FHIR.DTL.vR4.Model.Resource.Bundle' instantiate='0' deletewithcontext='0' />
<property name='medications' type='Ens.StreamContainer' instantiate='0' deletewithcontext='0' />
<property name='medicationsJSON' type='%String' instantiate='0' deletewithcontext='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1000' >
<call name='get patient data' target='get Patient' async='0' xpos='200' ypos='250' >
<request type='msg.request.patient' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='msg.response.patient' >
<assign property="context.patient" value="callresponse" action="set" />
</response>
</call>
<call name='get medications data' target='get Medication' async='0' xpos='200' ypos='350' >
<request type='msg.request.medication' >
<assign property="callrequest.patient" value="context.patient.id" action="set" />
</request>
<response type='Ens.StreamContainer' >
<assign property="context.medications" value="callresponse" action="set" />
</response>
</call>
<code name='medicationsJSON' xpos='200' ypos='450' >
<![CDATA[ while 'context.medications.Stream.AtEnd {
  set context.medicationsJSON = context.medicationsJSON _ context.medications.Stream.Read()
 }]]>
</code>
<assign name="bundle" property="response" value="##class(utils.BundleBuilder).BuildBundle(context.patient,context.medicationsJSON)" action="set" xpos='200' ypos='550' />
<switch name='sql | fhir' xpos='200' ypos='650' xend='200' yend='900' >
<case condition='request.format="sql"' name='sql' />
<case condition='request.format="sql"' name='sql' />
<case condition='request.format="sql"' name='sql' >
<empty name='do nothing' xpos='335' ypos='800' />
</case>
<case condition='request.format="fhir"' >
<transform name='sql to fhir Bundle' class='IRISAPP.transfo.sqltofhir.Bundle' source='response' target='context.bundle' xpos='605' ypos='800' >
<annotation><![CDATA[transform into a Bundle resource]]></annotation>
</transform>
<assign name="json" property="response.json" value="context.bundle.ToJSON().Read()" action="set" xpos='812' ypos='884' />
</case>
<default/>
</switch>
</sequence>
</process>
}

}
