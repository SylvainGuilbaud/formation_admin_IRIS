Class IRISAPP.customer Extends (%Persistent, %Populate)
{

Property Name As %String;

Property Address As %String;

Property City As %String;

Property Country As %String;

Storage Default
{
<Data name="customerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Address</Value>
</Value>
<Value name="4">
<Value>City</Value>
</Value>
<Value name="5">
<Value>Country</Value>
</Value>
</Data>
<DataLocation>^IRISAPP.customerD</DataLocation>
<DefaultData>customerDefaultData</DefaultData>
<IdLocation>^IRISAPP.customerD</IdLocation>
<IndexLocation>^IRISAPP.customerI</IndexLocation>
<StreamLocation>^IRISAPP.customerS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
