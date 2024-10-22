Class FHIRSERVERPKG.FoundationProduction Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="FHIRSERVERPKG.FoundationProduction" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="maj PG" Category="" ClassName="EnsLib.SQL.Operation.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="InputParameters">*id,*lastname,*firstname,*dob</Setting>
    <Setting Target="Host" Name="Query">insert into app.personne (id,lastname,firstname,dob) values (?,?,?,?)</Setting>
    <Setting Target="Adapter" Name="DSN">postgres</Setting>
    <Setting Target="Adapter" Name="JGService">Java Gateway</Setting>
    <Setting Target="Host" Name="RequestClass">msg.personne</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="Java Gateway" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="from FHIR" Category="" ClassName="EnsLib.SQL.Service.GenericService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="DSN">iris</Setting>
    <Setting Target="Adapter" Name="Query">SELECT 
ID1, Key, MDVersion, VersionId, _id, _lastUpdated, _profile, _security, _source, _tag, active, address, addressCity, addressCountry, addressPostalcode, addressState, addressUse, birthdate, deathDate, deceased, email, family, gender, generalPractitioner, given, identifier, "language", link, name, organization, phone, phonetic, telecom
FROM HSFHIR_X0001_S.Patient</Setting>
  </Item>
</Production>
}

}
