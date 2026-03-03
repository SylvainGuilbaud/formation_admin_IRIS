Class msg.request.patient Extends Ens.Request
{

Property id As %String;

Storage Default
{
<Data name="patientDefaultData">
<Subscript>"patient"</Subscript>
<Value name="1">
<Value>id</Value>
</Value>
</Data>
<DefaultData>patientDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
