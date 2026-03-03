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
  <Item Name="dw" Category="" ClassName="EnsLib.SQL.Operation.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="JGService">EnsLib.JavaGateway.Service</Setting>
    <Setting Target="Host" Name="Query">select id,last_name,first_name
from app.customer where id = ?</Setting>
    <Setting Target="Adapter" Name="DSN">postgres</Setting>
    <Setting Target="Host" Name="InputParameters">*id</Setting>
    <Setting Target="Host" Name="RequestClass">msg.request.patient</Setting>
    <Setting Target="Host" Name="ResponseClass">msg.response.patient</Setting>
  </Item>
  <Item Name="EnsLib.JavaGateway.Service" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%gatewayName">%JDBC Server</Setting>
  </Item>
  <Item Name="REST.service" Category="" ClassName="REST.service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">sql to fhir</Setting>
  </Item>
  <Item Name="sql to fhir" Category="" ClassName="IRISAPP.process.sqltofhir" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
