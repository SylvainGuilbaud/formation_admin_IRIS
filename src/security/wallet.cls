Class security.wallet
{

/// Description
ClassMethod addKey(collection As %String, keyName As %String, user As %String, password As %String) As %Status
{
    set ns = $namespace
    Set sc = $$$OK

    if ##class(%Wallet.Collection).Exists(collection)=0 {
        write "Creating wallet collection: ", collection, !
        zn "%sys"
        DO ##class(Security.Resources).Create("SQLGatewayUseResource")
        DO ##class(Security.Resources).Create("SQLGatewayEditResource")
        set sc=##class(%Wallet.Collection).Create(collection, {
            "UseResource":"SQLGatewayUseResource:READ",
            "EditResource":"SQLGatewayEditResource:WRITE"
            })
        if $$$ISERR(sc) {
            set errorMessage = $system.Status.GetErrorText(sc)
            write "Error creating wallet collection: ", errorMessage, !
            return sc
        } 
    }
    zn ns
    if ##class(%Wallet.KeyValue).Exists(collection_"."_keyName) {
        write "Key ", keyName, " already exists in collection: ", collection, !
    } else {    
        write "Creating Wallet KeyValue", keyName, " in collection: ", collection, !
        SET sc = ##class(%Wallet.KeyValue).Create(
            collection_"."_keyName, {
            "RequireTLS": false,
            "Secret": {"user" : (user), "password" : (password)},
            "Usage": ["SQL"]
        })
        if $$$ISERR(sc) {
            set errorMessage = $system.Status.GetErrorText(sc)
            write "Error adding key to wallet: ", errorMessage, !
        } else {
            write "Key added to wallet successfully.", !
        } 
    }

    Return sc
}

/// Description
ClassMethod init(reset As %Boolean = 0) As %Status
{
    Set sc = $$$OK
    if reset {
        do ##class(%Wallet.KeyValue).Delete("SQLGateway.IRIS")
        do ##class(%Wallet.KeyValue).Delete("SQLGateway.postgres")
    }
    set sc = ##class(security.wallet).addKey("SQLGateway","IRIS","_system","SYS")   
    set sc = ##class(security.wallet).addKey("SQLGateway","postgres","postgres","postgres")   

    Return sc
}

}
