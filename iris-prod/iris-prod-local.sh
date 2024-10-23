    
cat << EOF | iris session iris
zn "IRISAPP"
set productionName=##class(Ens.Director).GetActiveProductionName()
set configItem = "BO_SYNC_OSCAR_FHIR"
set step="settings local default settings for " _ configItem _ " in production " _ productionName 
set ^Ens.Config.DefaultSettingsD(productionName,configItem,"*","HTTPServer")=\$lb("host.docker.internal","",0)
set ^Ens.Config.DefaultSettingsD(productionName,configItem,"*","SSLCheckServerIdentity")=\$lb("0","",0)
set ^["USER"]TRACE(\$zdt(\$now(),3,,6),step)="successful"
set step="Disable " _ configItem _ " in production " _ productionName 
set sc = ##class(Ens.Director).EnableConfigItem(configItem,0)
if 'sc { set ^["USER"]TRACE(\$zdt(\$now(),3,,6),step)=\$lb(\$system.Status.GetErrorCodes(sc),\$system.Status.GetErrorText(sc))} else { set ^["USER"]TRACE(\$zdt(\$now(),3,,6),step)="successful"}
set step="Enable " _ configItem _ " in production " _ productionName 
set sc = ##class(Ens.Director).EnableConfigItem(configItem,1)
if 'sc { set ^["USER"]TRACE(\$zdt(\$now(),3,,6),step)=\$lb(\$system.Status.GetErrorCodes(sc),\$system.Status.GetErrorText(sc))} else { set ^["USER"]TRACE(\$zdt(\$now(),3,,6),step)="successful"}
set context = "dev"
set step = "Activating " _ context _ " context"
set activeContext = ##class(FHIR.utils).setFHIRContext(context)
set ^["USER"]TRACE(\$zdt(\$now(),3,,6),step)=activeContext
halt
EOF
