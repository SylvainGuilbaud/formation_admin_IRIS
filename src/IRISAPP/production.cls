Class IRISAPP.production Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="IRISAPP.production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="HS.FHIRServer.Interop.Service" Category="" ClassName="HS.FHIRServer.Interop.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HS.FHIRServer.Interop.Operation" Category="" ClassName="HS.FHIRServer.Interop.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="REST.service" Category="" ClassName="REST.service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">sql to fhir</Setting>
  </Item>
  <Item Name="sql to fhir" Category="" ClassName="IRISAPP.process.sqltofhir" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="get Patient" Category="" ClassName="EnsLib.SQL.Operation.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="JGService">%JDBC Server</Setting>
    <Setting Target="Host" Name="Query">select id,
    identifier_value,
    identifier_use,
    name_use,
    name_family,
    name_given,
    name_text,
    telecom_system,
    telecom_value,
    telecom_use,
    gender,
    birth_date,
    address_use,
    address_line,
    address_city,
    address_postal_code,
    address_country
from app.patient
where id = ?</Setting>
    <Setting Target="Adapter" Name="DSN">postgres</Setting>
    <Setting Target="Host" Name="InputParameters">*id</Setting>
    <Setting Target="Host" Name="RequestClass">msg.request.patient</Setting>
    <Setting Target="Host" Name="ResponseClass">msg.response.patient</Setting>
  </Item>
  <Item Name="get Medication" Category="" ClassName="EnsLib.SQL.Operation.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="JGService">%JDBC Server</Setting>
    <Setting Target="Host" Name="Query">select id,
    status,
    intent,
    medication_concept_system,
    medication_concept_code,
    medication_concept_display,
    subject_reference,
    subject_display,
    authored_on,
    requester_display,
    dosage_text,
    dosage_route_display,
    dosage_dose_value,
    dosage_dose_unit,
    dispense_quantity_value,
    dispense_quantity_unit,
    dispense_number_of_repeats_allowed
from app.medication_request
where subject_reference = ?</Setting>
    <Setting Target="Adapter" Name="DSN">postgres</Setting>
    <Setting Target="Host" Name="InputParameters">*patient</Setting>
    <Setting Target="Host" Name="RequestClass">msg.request.medication</Setting>
    <Setting Target="Host" Name="ResponseClass"></Setting>
  </Item>
</Production>
}

}
