Class msg.response.patient Extends Ens.Response
{

Property id As %String;

Property "last_name" As %String [ SqlFieldName = last_name ];

Property "first_name" As %String [ SqlFieldName = first_name ];

Storage Default
{
<Data name="patientDefaultData">
<Subscript>"patient"</Subscript>
<Value name="1">
<Value>id</Value>
</Value>
<Value name="2">
<Value>last_name</Value>
</Value>
<Value name="3">
<Value>first_name</Value>
</Value>
</Data>
<DefaultData>patientDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
