Class data.customer Extends (%Persistent, %Populate)
{

/// Customer first name
Property FirstName As %String(MAXLEN = 100) [ Required ];

/// Customer last name
Property LastName As %String(MAXLEN = 100) [ Required ];

/// Customer email address
Property Email As %String(MAXLEN = 255) [ Required ];

/// Customer phone number
Property Phone As %String(MAXLEN = 20);

/// Customer date of birth
Property DateOfBirth As %Date;

/// Customer street address
Property Street As %String(MAXLEN = 255);

/// Customer city
Property City As %String(MAXLEN = 100);

/// Customer state or province
Property State As %String(MAXLEN = 100);

/// Customer postal code
Property PostalCode As %String(MAXLEN = 20);

/// Customer country
Property Country As %String(MAXLEN = 100);

/// Customer creation date
Property CreatedAt As %TimeStamp [ InitialExpression = {$ZDATETIME($HOROLOG, 3)} ];

/// Whether the customer is active
Property IsActive As %Boolean [ InitialExpression = 1 ];

Index EmailIndex On Email [ Unique ];

Index LastNameIndex On LastName;

Index CityIndex On City;

Storage Default
{
<Data name="customerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirstName</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>Email</Value>
</Value>
<Value name="5">
<Value>Phone</Value>
</Value>
<Value name="6">
<Value>DateOfBirth</Value>
</Value>
<Value name="7">
<Value>Street</Value>
</Value>
<Value name="8">
<Value>City</Value>
</Value>
<Value name="9">
<Value>State</Value>
</Value>
<Value name="10">
<Value>PostalCode</Value>
</Value>
<Value name="11">
<Value>Country</Value>
</Value>
<Value name="12">
<Value>CreatedAt</Value>
</Value>
<Value name="13">
<Value>IsActive</Value>
</Value>
</Data>
<DataLocation>^data.customerD</DataLocation>
<DefaultData>customerDefaultData</DefaultData>
<IdLocation>^data.customerD</IdLocation>
<IndexLocation>^data.customerI</IndexLocation>
<StreamLocation>^data.customerS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
