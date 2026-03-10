Class data.personne Extends (%Persistent, %Populate)
{

Parameter ROWLEVELSECURITY = 1;

Parameter USEEXTENTSET = 1;

ClassMethod %SecurityPolicy(city As %String) As %String [ SqlProc ]
{
    return "%All,"_city
}

Property nom As %String(MAXLEN = "", POPSPEC = "FirstName()") [ Required ];

Property prenom As %String(MAXLEN = "", POPSPEC = "LastName()") [ Required ];

Property city As %String(MAXLEN = "", POPSPEC = "City()");

Storage Default
{
<Data name="personneDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>nom</Value>
</Value>
<Value name="3">
<Value>prenom</Value>
</Value>
<Value name="4">
<Value>%READERLIST</Value>
</Value>
<Value name="5">
<Value>city</Value>
</Value>
</Data>
<DataLocation>^DBVV.HwnK.1</DataLocation>
<DefaultData>personneDefaultData</DefaultData>
<ExtentLocation>^DBVV.HwnK</ExtentLocation>
<IdLocation>^DBVV.HwnK.1</IdLocation>
<Index name="$personne">
<Location>^DBVV.HwnK.2</Location>
</Index>
<Index name="%RLI">
<Location>^DBVV.HwnK.3</Location>
</Index>
<Index name="IDKEY">
<Location>^DBVV.HwnK.1</Location>
</Index>
<IndexLocation>^DBVV.HwnK.I</IndexLocation>
<StreamLocation>^DBVV.HwnK.S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
