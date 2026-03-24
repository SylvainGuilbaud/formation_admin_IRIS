Class IRISAPP.production Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="IRISAPP.production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="HS.FHIRServer.Interop.Service" Category="" ClassName="HS.FHIRServer.Interop.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HS.FHIRServer.Interop.Operation" Category="" ClassName="HS.FHIRServer.Interop.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
     <Item Name="MsgRouter" Category="" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="This handles message routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">IRISAPP.production.RoutingRule</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
  </Item>
  <Item Name="de HL7 ADT IHE PAM FR - TCP" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">HL7v25IHE:ADT_AXX</Setting>
    <Setting Target="Adapter" Name="Port">39201</Setting>
    <Setting Target="Host" Name="TargetConfigNames">MsgRouter</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Host" Name="DefCharEncoding">Native</Setting>
  </Item>
    <Item Name="vers non IHE HL7v2 ADT - FICHIER" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="This is a default HL7 File Operation." LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/data/HL7/out</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
</Production>
}

}
