select id,
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
where subject_reference = ?