/// API minimale avec deux endpoints: /sql/{id} retourne les données SQL brutes, /fhir/{id} retourne un Patient FHIR.<br/>
/// Business logic class defined by OpenAPI in sqltofhir.spec<br/>
/// Updated Mar 3, 2026 17:53:57
Class sqltofhir.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// Récupérer les données patient au format SQL (JSON brut)<br/>
/// The method arguments hold values for:<br/>
///     id, Identifiant du patient côté SQL<br/>
ClassMethod getSqlPatientById(id As %String) As %DynamicObject
{
    set json = {}
    set json.id = id
    set tSC=##class(Ens.Director).CreateBusinessService("REST.service",.tService)
    set request = ##class(msg.request.patient).%New()
    set request.id = id
    set sc=tService.ProcessInput(request,.response)
        
    if $ISOBJECT(response) {
        set json.firstName = (response."first_name")
        set json.lastName = (response."last_name")
    } else {
        set json.status = "Patient introuvable"
    }
    
    return json.%ToJSON()
}

/// Récupérer le patient au format FHIR (Patient)<br/>
/// The method arguments hold values for:<br/>
///     id, Identifiant du patient (mappé depuis l'ID SQL)<br/>
ClassMethod getFhirPatientById(id As %String) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

}
