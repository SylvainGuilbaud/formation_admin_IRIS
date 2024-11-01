Class APP.production Extends Ens.Production
{

ClassMethod OnStart(pTimeStarted As %String) As %Status
{
  #; do ##class(%File).CopyDir("/data/HL7/test","/data/HL7/in",1)
  #; do ##class(%File).CopyDir("/data/HL7/test","/data/HL7/validate",1)
  do ##class(Ens.Util.Statistics).EnableStatsForProduction()
  do ##class(Ens.Util.Statistics).EnableSAMForNamespace()
	return $$$OK
}

XData ProductionDefinition
{
<Production Name="APP.production" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Ens.ProductionMonitorService" Category="" ClassName="Ens.ProductionMonitorService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Ens.Activity.Operation.Local" Category="" ClassName="Ens.Activity.Operation.Local" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HL7v2toSDA" Category="" ClassName="FHIR.process.HL7v2toSDA" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">SDAtoFHIR</Setting>
  </Item>
  <Item Name="SDAtoFHIR" Category="" ClassName="FHIR.process.SDAtoFHIR" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TraceOperations">*FULL*</Setting>
    <Setting Target="Host" Name="FHIREndpoint">/fhir/r4</Setting>
    <Setting Target="Host" Name="FHIRMetadataSet">HL7v40 / FHIR R4 Core Specification</Setting>
    <Setting Target="Host" Name="TargetConfigName">BO_PAT_HTTP_FHIR</Setting>
    <Setting Target="Host" Name="TransmissionMode">transaction</Setting>
    <Setting Target="Host" Name="syncFHIRContentType">fhir</Setting>
  </Item>
  <Item Name="HS.Util.Trace.Operations" Category="" ClassName="HS.Util.Trace.Operations" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="HS.FHIRServer.Interop.Service" Category="" ClassName="HS.FHIRServer.Interop.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">BO_PAT_HTTP_FHIR</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="Ens.Alert" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">APP.AlertRouter.Ens.AlertRoutingRule</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="BS_CLO_PAT_FLOW_FILE_HLP" Category="HL7" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="TargetConfigNames">HL7v2toSDA</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/lorah/data/HL7/archive</Setting>
    <Setting Target="Adapter" Name="FilePath">/lorah/data/HL7/in/</Setting>
    <Setting Target="Adapter" Name="WorkPath">/lorah/data/HL7/work</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">IHEv25</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="BS_ODS_PAT_INIT_FILES_CSV" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">APP.RM.Patient</Setting>
    <Setting Target="Host" Name="TargetConfigNames">BP_PAT_INIT_CORE</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/lorah/data/CSV/archive</Setting>
    <Setting Target="Adapter" Name="FilePath">/lorah/data/CSV/in</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.csv</Setting>
    <Setting Target="Adapter" Name="WorkPath">/lorah/data/CSV/work</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Host" Name="HeaderCount">1</Setting>
  </Item>
  <Item Name="BO_PAT_HTTP_FHIR" Category="" ClassName="HS.FHIRServer.Interop.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Host" Name="TraceOperations">*FULL*</Setting>
  </Item>
  <Item Name="BP_PAT_INIT_CORE" Category="" ClassName="APP.process.CSVtoFHIR" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="BS_CLO_PAT_FLOW_HTTP_HLP" Category="HL7" ClassName="EnsLib.HL7.Service.HTTPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">HL7v2toSDA</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.5.1</Setting>
    <Setting Target="Adapter" Name="SSLConfig">webgateway</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="APP.operation.OSCAR" Category="" ClassName="APP.operation.OSCAR" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">443</Setting>
    <Setting Target="Adapter" Name="Credentials">FHIRServer</Setting>
    <Setting Target="Adapter" Name="URL">/oscar/app/sync</Setting>
    <Setting Target="Adapter" Name="SSLConfig">ipc</Setting>
  </Item>
  <Item Name="BO_SYNC_OSCAR_FHIR" Category="" ClassName="APP.operation.OSCAR" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">443</Setting>
    <Setting Target="Adapter" Name="Credentials">FHIRServer</Setting>
    <Setting Target="Adapter" Name="URL">/oscar/app/sync</Setting>
    <Setting Target="Adapter" Name="SSLConfig">ipc</Setting>
  </Item>
</Production>
}

}
