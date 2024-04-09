
Alias: $MedicationPSCA = http://fhir.infoway-inforoute.ca/io/psca/StructureDefinition/medication-ca-ps
Profile: MedicationPSAB
Parent: $MedicationPSCA
Id: MedicationPSAB
Title: "Medication (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR Medication resource for use in Alberta Patient Summaries (PS-AB). It re-profiles the PS-CA Medication profile and refines the constraints that represent the minimum expectations for the Medication resource when used in the PS-AB MedicationStatement profile"
* ^status = #draft

* code 1.. MS
* code.text 1.. MS
* code.text ^comment = "Mandatory if any prescribed medication data is present; otherwise must be blank/null. String: Max Character length (200)"
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains CCDD 0..* MS
* code.coding[CCDD] ^comment = "Optional - submit if available [Note: Not always recorded in patient chart; and not always applicable - compound medications do not have a DIN number for example.] Reference: Health Canada Drug ID Number"
* code.coding[CCDD].system 1.. MS
* code.coding[CCDD].system = "http://terminology.hl7.org/CodeSystem/hc-CCDD" (exactly)
* form MS
* form.coding ^comment = "No terminology has been defined in AB for this element. Future releases may include defined terminology"
* form.text MS 
