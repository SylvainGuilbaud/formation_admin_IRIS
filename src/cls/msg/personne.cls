Class msg.personne Extends Ens.Request
{

/// Description
Property id As %Integer;

Property lastname As %String;

Property firstname As %String;

Property dob As %Date(FORMAT = 3);

Storage Default
{
<Data name="personneDefaultData">
<Subscript>"personne"</Subscript>
<Value name="1">
<Value>id</Value>
</Value>
<Value name="2">
<Value>lastname</Value>
</Value>
<Value name="3">
<Value>firstname</Value>
</Value>
<Value name="4">
<Value>dob</Value>
</Value>
</Data>
<DefaultData>personneDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
