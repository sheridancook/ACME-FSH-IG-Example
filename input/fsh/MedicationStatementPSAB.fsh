 Alias: $MedicationStatementPSCA = http://fhir.infoway-inforoute.ca/io/psca/StructureDefinition/medicationstatement-ca-ps


Profile: MedicationStatementPSAB
Parent: $MedicationStatementPSCA
Id:     MedicationStatementPSAB
Title: "MedicationStatement (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR MedicationStatement resource for use in Alberta Patient Summaries (PS-AB). It re-profiles the PS-CA MedicationStatement profile and refines constraints that represent the minimum expectations for the MedicationStatement resource when used in the PS-AB Composition profile."
* ^status = #draft
* . ^comment = "MedicationStatement resources included in Alberta Patient Summary Document Bundles SHALL NOT contain any of the following MedicationStatement details: statusReason,  context, dateAsserted, informationSource, derivedFrom, reasonReference, dosage.site, dosage.method, dosage.doseAndRate.type,dosage. doseAndRate.rate[x], dosage.maxDosePerPeriod, dosage.maxDosePerAdministration, dosage.maxDosePerLifetime. These rules are mechanically enforced through invariants at the PS-AB Bundle level."

* status = #unknown
* medication[x] MS
* medicationCodeableConcept ^sliceName = "medicationCodeableConcept"
* medicationCodeableConcept ^sliceIsConstraining = true
* medicationCodeableConcept ^comment = "Supply of medicationReference is preferred over medicationCodeableConcept, however both are allowed in the context of Alberta Patient Summaries"
* medicationReference ^sliceName = "medicationReference"
* medicationReference ^sliceIsConstraining = true
* medicationReference only Reference(MedicationPSAB)
* subject only Reference(PatientPSAB)
* subject.reference 1..1 MS

* effective[x] 1..1 MS 
* effective[x] ^slicing.discriminator.type = #type
* effective[x] ^slicing.discriminator.path = "$this"
* effective[x] ^slicing.rules = #open
* effectiveDateTime MS
* effectiveDateTime ^sliceName = "effectiveDateTime"
* effectiveDateTime ^comment = "YYYY-MM-DD format. Partial dates (YYYY only or YYYY-MM only) are accepted. Required for each submitted medication"
* effectiveDateTime MS
* effectiveDateTime only dateTime
* note 
* dosage MS
* dosage.sequence 
* dosage.text MS
* dosage.text ^comment = "since the dosage.doseAndrate does not accommodate any text, Amount of medication per dose could be recorded here"
* dosage.patientInstruction 
* dosage.timing
* dosage.route.text ^comment = "Optional String: Max Character length (20) [May be full text name (e.g., by mouth) or abbreviation (e.g., PO); as well as non-standardized text] \n Include a 'recommended reference set' for common values, and allow other content as well? (i.e., not validated, but promoting/encouraging usage of standard values)"
* dosage.doseAndRate ^comment = "If the dose is intended to change over time, depending on local rules/regulations, each change should be captured as a new version of the MedicationRequest with an updated dose, or captured with a new MedicationRequest with the new dose."

