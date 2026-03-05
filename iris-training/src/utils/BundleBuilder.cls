Class utils.BundleBuilder
{

ClassMethod BuildBundle(patient As msg.response.patient, json As %String) As msg.response.bundle
{
    Set bundle = ##class(msg.response.bundle).%New()
    Set bundle.patient = patient
    Set bundle.medications = ##class(%ListOfObjects).%New()

    Set root = ##class(%DynamicObject).%FromJSON(json)

    // Parcours des clés "1","2","3",... (DynamicObject -> iterator)
    Set it = root.%GetIterator()
    While it.%GetNext(.n, .node) {

        // node = %DynamicObject (la prescription)
        Set med = ##class(msg.response.medication).%New()

        // Affectations directes (pas de %Set)
        Set med.id     = node.id
        Set med.status = node.status
        Set med.intent = node.intent

        Set med."medication_concept_system"  = node."medication_concept_system"
        Set med."medication_concept_code"    = node."medication_concept_code"
        Set med."medication_concept_display" = node."medication_concept_display"

        Set med."subject_reference" = node."subject_reference"
        Set med."subject_display"   = node."subject_display"
        Set med."authored_on"       = node."authored_on"
        Set med."requester_display" = node."requester_display"

        Set med."dosage_text"          = node."dosage_text"
        Set med."dosage_route_display" = node."dosage_route_display"
        Set med."dosage_dose_value"    = node."dosage_dose_value"
        Set med."dosage_dose_unit"     = node."dosage_dose_unit"

        Set med."dispense_quantity_value" = node."dispense_quantity_value"
        Set med."dispense_quantity_unit"  = node."dispense_quantity_unit"
        Set med."dispense_number_of_repeats_allowed" = node."dispense_number_of_repeats_allowed"

        Do bundle.medications.Insert(med)

    }

    return bundle
}

}
