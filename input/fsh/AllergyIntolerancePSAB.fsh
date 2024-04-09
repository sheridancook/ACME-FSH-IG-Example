Alias: $AllergyIntolerancePSCA = http://fhir.infoway-inforoute.ca/io/psca/StructureDefinition/allergyintolerance-ca-ps

Profile: AllergyIntolerancePSAB
Parent: $AllergyIntolerancePSCA
Id:     AllergyIntolerancePSAB
Title: "AllergyIntolerance (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR AllergyIntolerance resource for use in Alberta Patient Summaries (PS-AB). It re-profiles the PS-CA AllergyIntolerance profile and refines constraints applied to the AllergyIntolerance resource by the PS-CA project to represent the minimum expectations for the AllergyIntolerance resource when used in the PS-AB Composition profile."

* ^status = #draft 
* . ^comment = "AllergyIntolerance resources included in Alberta Patient Summary Document Bundles SHALL NOT contain any of the following AllergyIntolerance details: verificationStatus, encounter, asserter. These rules are mechanically enforced through invariants at the PS-AB Bundle level."

* clinicalStatus.coding[HL7AllergyIntoleranceClinicalStatus] ^sliceIsConstraining = true
* clinicalStatus.coding[HL7AllergyIntoleranceClinicalStatus] 1..1 MS
* clinicalStatus.coding[HL7AllergyIntoleranceClinicalStatus] ^comment = "If clinicalStatus is supplied, a coding SHALL be supplied with at least one coding from the HL7AllergyIntoleranceClinicalStatus valueSet"
* code ^comment = "No terminology has been defined in AB for this element. Future releases may include defined terminology"
* code.text 1..1 MS
* code.text ^comment = "Required if any allergy/intolerance data is submitted; otherwise blank/null. String: Max Character length (250)"
* patient MS
* patient only Reference(PatientPSAB)
* patient.reference 1..1 MS
* onset[x] ^comment = "May be full or partial date, numeric age or string description"
* recorder only Reference(PractitionerPSAB or PractitionerRolePSAB or Patient or RelatedPerson)
* lastOccurrence ^comment = "If supplied, optional YYYY-MM-DD format. Partial dates (YYYY only or YYYY-MM only) are accepted. ISO-8601 doesn't support partial dates like YYYY or YYYY-MM"
* reaction.manifestation ^comment = "AllergyIntolerance.reaction.manifestation only needs to be populated if AllergyIntolerance.reaction is populated with other details. No terminology has been defined in AB for this element. Future releases may include defined terminology"
* reaction.manifestation.text 1.. MS
* reaction.manifestation.text ^comment = "AllergyIntolerance.reaction.manifestation.text only needs to be populated if AllergyIntolerance.reaction is populated with other details"
