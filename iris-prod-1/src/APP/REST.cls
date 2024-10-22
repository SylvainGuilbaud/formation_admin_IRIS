Include common

Class APP.REST Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

Parameter BsName = "source Portail Santé";

Parameter CHARSET = "utf-8";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<!--get version-->
<Route Url="/version" Method="GET" Call="version"/>
<!--send 9 HL7v2 messages to IRISAPP production -->
<Route Url="/envoi-HM-HL7v2" Method="PATCH" Call="sendHMHL7v2" Cors="true"/>
<!--send all files with name corresponding to the given 'filename*'-->
<Route Url="/envoi-HM-HL7v2/:sourceFile" Method="PATCH" Call="sendAnyHL7v2" Cors="true"/>
<!--send HM_FORM_20240801_14389067.hl7 -->
<Route Url="/envoi-HM-HL7v2/message1" Method="PATCH" Call="sendMessage1" Cors="true"/>
<!--send HM_FORM_20240801_14389201.hl7 -->
<Route Url="/envoi-HM-HL7v2/message2" Method="PATCH" Call="sendMessage2" Cors="true"/>
<!--send HM_FORM_20240801_14389206.hl7 -->
<Route Url="/envoi-HM-HL7v2/message3" Method="PATCH" Call="sendMessage3" Cors="true"/>
<!--send HM_FORM_20240801_14389576.hl7 -->
<Route Url="/envoi-HM-HL7v2/message4" Method="PATCH" Call="sendMessage4" Cors="true"/>
<!--Get all Patients -->
<Route Url="/fhir/r4/Patient" Method="GET" Call="getPatient" Cors="true"/>
<!--Get all Practitioners -->
<Route Url="/fhir/r4/Practitioner" Method="GET" Call="getPractitioner" Cors="true"/>
<!--Get all Organizations -->
<Route Url="/fhir/r4/Organization" Method="GET" Call="getOrganization" Cors="true"/>
<!--Get all Locations -->
<Route Url="/fhir/r4/Location" Method="GET" Call="getLocation" Cors="true"/>
<!--Get all Encounters -->
<Route Url="/fhir/r4/Encounter" Method="GET" Call="getEncounter" Cors="true"/>
<!--Get all RelatedPersons -->
<Route Url="/fhir/r4/RelatedPerson" Method="GET" Call="getRelatedPerson" Cors="true"/>
<!--Get $everything from 1 Patient -->
<Route Url="/fhir/r4/Patient/:id/everything" Method="GET" Call="getPatientEverything" Cors="true"/>
<!--Get any resource -->
<Route Url="/fhir/r4/:resource" Method="GET" Call="getAnyFHIRResource" Cors="true"/>
<!--Purge all interop messages, logs and all FHIR resources-->
<Route Url="/purge" Method="DELETE" Call="purge"/>
<!--switch between local DEV config or IPC (internal only) the result is displayed through /version method -->
<Route Url="/config/:context" Method="PATCH" Call="config"/>
</Routes>
}

ClassMethod config(context As %String) As %Status
{

    set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}

    set json.context = ##class(FHIR.utils).setFHIRContext(context)
   
    do json.%ToJSON()
    return sc
}

/// send HM HL7 messages 
ClassMethod sendHMHL7v2() As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}
    #; set source = "/lorah/data/HL7/test/HM*", target ="/lorah/data/HL7/in", verbose = 0
    set source = "/data-iop/test/HM*", target ="/data-iop/input", verbose = 0
    set sc = ##class(FHIR.utils).sendHL7v2(source,target,verbose)
    if sc {
        set json.result = (source _ " files successfully copied into " _ target)
    } else {
        set json.error = ($system.Status.GetErrorText(sc))
    }
    set json.ts = ($zdt($h,3))
    do json.%ToJSON()
    return sc
}

ClassMethod sendMessage1() As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}
    set source = "/lorah/data/HL7/test/HM_FORM_20240801_14389067*", target ="/lorah/data/HL7/in", verbose = 0
    set sc = ##class(FHIR.utils).sendHL7v2(source,target,verbose)
    if sc {
        set json.result = (source _ " files successfully copied into " _ target)
    } else {
        set json.error = ($system.Status.GetErrorText(sc))
    }
    set json.ts = ($zdt($h,3))
    do json.%ToJSON()
    return sc
}

ClassMethod sendMessage2() As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}
    set source = "/lorah/data/HL7/test/HM_FORM_20240801_14389201*", target ="/lorah/data/HL7/in", verbose = 0
    set sc = ##class(FHIR.utils).sendHL7v2(source,target,verbose)
    if sc {
        set json.result = (source _ " files successfully copied into " _ target)
    } else {
        set json.error = ($system.Status.GetErrorText(sc))
    }
    set json.ts = ($zdt($h,3))
    do json.%ToJSON()
    return sc
}

ClassMethod sendMessage3() As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}
    set source = "/lorah/data/HL7/test/HM_FORM_20240801_14389206*", target ="/lorah/data/HL7/in", verbose = 0
    set sc = ##class(FHIR.utils).sendHL7v2(source,target,verbose)
    if sc {
        set json.result = (source _ " files successfully copied into " _ target)
    } else {
        set json.error = ($system.Status.GetErrorText(sc))
    }
    set json.ts = ($zdt($h,3))
    do json.%ToJSON()
    return sc
}

ClassMethod sendMessage4() As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}
    set source = "/lorah/data/HL7/test/HM_FORM_20240801_14389576*", target ="/lorah/data/HL7/in", verbose = 0
    set sc = ##class(FHIR.utils).sendHL7v2(source,target,verbose)
    if sc {
        set json.result = (source _ " files successfully copied into " _ target)
    } else {
        set json.error = ($system.Status.GetErrorText(sc))
    }
    set json.ts = ($zdt($h,3))
    do json.%ToJSON()
    return sc
}

ClassMethod sendAnyHL7v2(HL7v2Files As %String) As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}
    set source = "/lorah/data/HL7/test/"_ HL7v2Files _ "*", target ="/lorah/data/HL7/in", verbose = 0
    set sc = ##class(FHIR.utils).sendHL7v2(source,target,verbose)
    if sc {
        set json.result = (source _ " files successfully copied into " _ target)
    } else {
        set json.error = ($system.Status.GetErrorText(sc))
    }
    set json.ts = ($zdt($h,3))
    do json.%ToJSON()
    return sc
}

/// purge all FHIR resources 
ClassMethod purge() As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set FHIRENDPOINT = ##class(FHIR.utils).getFHIREndpoint()
    set json = {}
    kill ^DEBUGFHIRRESOURCES
    set daysToKeep=0,keepIntegrity=0,bodiesToo=1,deleted=0
    set sc=##class(Ens.Purge).PurgeAll(.deleted,daysToKeep,keepIntegrity,bodiesToo)
    set json.BitmapChunks=$g(deleted("Bitmap Chunks"))
    set json.BusinessProcesses=$g(deleted("Business Processes"))
    set json.BusinessRuleLogs=$g(deleted("Business Rule Logs"))
    set json.EnsembleMessages=$g(deleted("Ensemble Messages"))
    set json.EventLogs=$g(deleted("Event Logs"))
    set json.HostMonitorData=$g(deleted("Host Monitor Data"))
    set json.IOLogs=$g(deleted("I/O Logs"))
    set json.ManagedAlerts=$g(deleted("Managed Alerts"))
    set json.MessageBodies=$g(deleted("Message Bodies"))
    set sc = ##class(FHIR.utils).purge(FHIRENDPOINT)
    if sc {
        set json.result = ("all resources successfully purged from FHIR repository " _ FHIRENDPOINT)
    } else {
        set json.error = ($system.Status.GetErrorText(sc))
    }
    set json.ts = ($zdt($h,3))
    do json.%ToJSON()
    return sc
}

ClassMethod getAnyFHIRResource(resource As %String) As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}, url=""
    try {
        set request = ##class(%Net.HttpRequest).%New()	
        set sc = ##class(FHIR.utils).getCredentials(##class(FHIR.utils).getFHIRCredentials(),.credentials)
        if sc {    
            set request.Username = credentials.Username
            set request.Password = credentials.Password
            set request.InitiateAuthentication = "Basic"
            set request.ContentType = "application/fhir+json; charset=UTF-8"
            do request.SetHeader("Accept","*/*")
            set request.Https=1
            set request.Server= ##class(FHIR.utils).getFHIRServer()
            set request.Port=##class(FHIR.utils).getFHIRHTTPSPort()
            set request.SSLConfiguration="ipc"
            set request.SSLCheckServerIdentity=0
            set url = "https://" _ request.Server _ ":" _ request.Port _ ##class(FHIR.utils).getFHIRProxyApp() _ ##class(FHIR.utils).getFHIREndpoint() _ "/" _ resource
            set url = ##class(%CSP.Utils).UnescapeURL(url)
            set json.url = (url)
            set sc = request.Get(url)
            set json.StatusCode = (request.HttpResponse.StatusCode)
            if sc {
                set json = {}.%FromJSON(request.HttpResponse.Data)
            } else {
                throw ##class(%Exception.StatusException).CreateFromStatus(sc)
            }
        } else {
            throw ##class(%Exception.StatusException).CreateFromStatus(sc)
        }
	} catch exp{
		set sc = exp.AsStatus()
        set json.error = $system.Status.GetErrorText(sc)
        set json.url = (url)
	}
    do json.%ToJSON()
    return $$$OK
}

ClassMethod getPatientEverything(id As %String) As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}, url=""
    try {
        set request = ##class(%Net.HttpRequest).%New()	
        set sc = ##class(FHIR.utils).getCredentials(##class(FHIR.utils).getFHIRCredentials(),.credentials)
        if sc {    
            set request.Username = credentials.Username
            set request.Password = credentials.Password
            set request.InitiateAuthentication = "Basic"
            set request.ContentType = "application/fhir+json; charset=UTF-8"
            do request.SetHeader("Accept","*/*")
            set request.Https=1
            set request.Server= ##class(FHIR.utils).getFHIRServer()
            set request.Port=##class(FHIR.utils).getFHIRHTTPSPort()
            set request.SSLConfiguration="ipc"
            set request.SSLCheckServerIdentity=0
            set url = "https://" _ ##class(FHIR.utils).getFHIRServer() _ ":" _ ##class(FHIR.utils).getFHIRHTTPSPort() _ ##class(FHIR.utils).getFHIRProxyApp() _ ##class(FHIR.utils).getFHIREndpoint() _ "/Patient/" _ id _ "/$everything"
            set url = ##class(%CSP.Utils).UnescapeURL(url)
            set json.url = (url)
            set sc = request.Get(url)
            set json.StatusCode = (request.HttpResponse.StatusCode)
            if sc {
                set json = {}.%FromJSON(request.HttpResponse.Data)
            } else {
                throw ##class(%Exception.StatusException).CreateFromStatus(sc)
            }
        } else {
            throw ##class(%Exception.StatusException).CreateFromStatus(sc)
        }
	} catch exp{
		set sc = exp.AsStatus()
        set json.error = $system.Status.GetErrorText(sc)
        set json.url = (url)
	}
    do json.%ToJSON()
    return $$$OK
}

ClassMethod getPatient() As %Status
{
    Set sc = $$$OK
    set sc = ..getAnyFHIRResource("Patient")
    return $$$OK
}

ClassMethod getPractitioner() As %Status
{
    Set sc = $$$OK
    set sc = ..getAnyFHIRResource("Practitioner")
    return $$$OK
}

ClassMethod getLocation() As %Status
{
    Set sc = $$$OK
    set sc = ..getAnyFHIRResource("Location")
    return $$$OK
}

ClassMethod getOrganization() As %Status
{
    Set sc = $$$OK
    set sc = ..getAnyFHIRResource("Organization")
    return $$$OK
}

ClassMethod getEncounter() As %Status
{
    Set sc = $$$OK
    set sc = ..getAnyFHIRResource("Encounter")
    return $$$OK
}

ClassMethod getRelatedPerson() As %Status
{
    Set sc = $$$OK
    set sc = ..getAnyFHIRResource("RelatedPerson")
    return $$$OK
}

ClassMethod SendFileContent() As %Status
{
    set %response.ContentType="application/json"
    If '..GetJSONFromRequest(.obj) {
        Set %response.Status = ..#HTTP400BADREQUEST
        Set error = {"errormessage": "JSON not found"}
        Write error.%ToJSON()
        Quit $$$OK
    }
    /// TODO  ajouter une modification
    Set content = obj.content
    set status = $$$OK
    set tMsg = ##class(EnsLib.HL7.Message).ImportFromString(content)
    try {
        $$$ThrowOnError(##class(Ens.Director).CreateBusinessService(..#BsName,.tService))
        
        $$$ThrowOnError(tService.ProcessInput(tMsg,.output))
    } catch(ex) {
        set status = ex.AsStatus()
    }
    
    Set result={}
    do result.%Set("Status",$s($$$ISERR(status):$system.Status.GetOneErrorText(status),1:"OK"))
    set result.ts=($zdt($h,3))
    write result.%ToJSON()
    return $$$OK
}

ClassMethod GetJSONFromRequest(ByRef obj As %DynamicObject) As %Boolean
{
  Set ok = 1
	Try {
		Set obj = ##class(%DynamicObject).%FromJSON(%request.Content)
	} Catch ex {
		Set ok = 0
	}
	Quit ok
}

ClassMethod version() As %Status
{

    set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}
    set json.context="Institut Paoli-Calmettes - IRISAPP"
    set json.FHIRContext = (##class(FHIR.utils).getFHIRContext())
    set json.FHIRServer = (##class(FHIR.utils).getFHIRServer())
    set json.FHIREndpoint = (##class(FHIR.utils).getFHIREndpoint())
    set json.IRISversion = ($zv)
    set json.buildDate = (##class(common.utils).version())      
    set json.date = ($zdt($h,3))
    set json.system = ($System)
    set json.username = ($Username)
    set json.roles = ($Roles)
    set json.namespace = ($Namespace)
    set nls = ##class(%SYS.NLS.Locale).GetLanguage()
    set json.country = ($listget(nls,1))
    set json.lang = ($listget(nls,2))
    set json.JavaHomeDirectory = $SYSTEM.Util.JavaHomeDirectory()
    set json.JavaExe = $SYSTEM.Util.JavaExe()
    do json.%ToJSON()
    return sc
}

// ClassMethod spec() As %Status

// {

//  try {

// 	set sc=$$$OK

// 	set %response.ContentType=..#CONTENTTYPEJSON

//     set file = ##class(%File).%New("/data/swagger-crud.json")

//     do file.Open("RS")

//     while 'file.AtEnd{

//         w file.ReadLine()

//     }

// 	} catch e {

// 		throw e

// 	}

// 	return sc

// }

ClassMethod %ProcessResult(pStatus As %Status = {$$$OK}, pResult As %DynamicObject = "") As %Status [ Internal ]
{
  #dim %response As %CSP.Response
  SET tSC = $$$OK
  IF $$$ISERR(pStatus) {
    SET %response.Status = 500
    SET tSC = ..StatusToJSON(pStatus, .tJSON)
    IF $isobject(tJSON) {
      SET pResult = tJSON
    } ELSE {
      SET pResult = { "errors": [ { "error": "Unknown error parsing status code" } ] }
    }
  } 
  ELSEIF pStatus=1 {
    IF '$isobject(pResult){
      SET pResult = {
      }
    }
  }
  ELSE {
    SET %response.Status = pStatus
    SET error = $PIECE(pStatus, " ", 2, *)
    SET pResult = {
      "error": (error)
    }
  }
  
  IF pResult.%Extends("%Library.DynamicAbstractObject") {
    WRITE pResult.%ToJSON()
  }
  ELSEIF pResult.%Extends("%JSON.Adaptor") {
    DO pResult.%JSONExport()
  }
  ELSEIF pResult.%Extends("%Stream.Object") {
    DO pResult.OutputToDevice()
  }
  
  QUIT tSC
}

ClassMethod OnHandleCorsRequest(url As %String) As %Status
{
	set url = %request.GetCgiEnv("HTTP_REFERER")
    set origin = $p(url,"/",1,3) // origin = "http(s)://origin.com:port"

    // here you can check specific origins
    // otherway, it will allow all origins (useful while developing only)

	do %response.SetHeader("Access-Control-Allow-Credentials","true")
	do %response.SetHeader("Access-Control-Allow-Methods","GET,POST,PUT,DELETE,OPTIONS")
	do %response.SetHeader("Access-Control-Allow-Origin",origin)
	do %response.SetHeader("Access-Control-Allow-Headers","Access-Control-Allow-Origin, Origin, X-Requested-With, Content-Type, Accept, Authorization, Cache-Control")
	quit $$$OK
}

}
