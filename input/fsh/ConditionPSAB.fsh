Alias: $ConditionPSCA = http://fhir.infoway-inforoute.ca/io/psca/StructureDefinition/condition-ca-ps 
Alias: $conditionCategoryCodes = http://terminology.hl7.org/CodeSystem/condition-category

Profile: ConditionPSAB
Parent: ConditionPSCA
Id:     ConditionPSAB
Title: "Condition (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR Condition resource for use in Alberta Patient Summaries (PS-AB). It re-profiles the PS-CA Condition profile and refines constraints applied to the Condition resource by the PS-CA project to represent the minimum expectations for the Condition resource when used in the PS-AB Composition profile."

* ^status = #draft 
* . ^comment = "Condition resources included in Alberta Patient Summary Document Bundles SHALL NOT contain any of the following Condition details: verificationStatus, severity, encounter, abatement, recorder, asserter, stage, evidence. These rules are mechanically enforced through invariants at the PS-AB Bundle level."
* clinicalStatus ^comment = "This element is optional. Only include clinicalStatus codes if they are captured in the clinical workflow and map to one of the required codes in the FHIR valueSet. If no codes in the required valueSet match the status captured clinically - then this element SHALL NOT be be populated"
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "Coding.code"
* category ^slicing.rules = #open
* category contains problemListItem 0..1 MS
* category[problemListItem].coding.system = $conditionCategoryCodes
* category[problemListItem].coding.code = #problem-list-item
* category[problemListItem] ^comment = "Codeable concept: 'Problem-list-item' allowed in PS-AB"
* code obeys psab-con-1
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains ICD9 0..* MS
* code.coding[ICD9] ^comment = "Coding is optional, if coding is sent there shall at least be one coding from the ICD-9-CM code system"
* code.coding[ICD9] ^mustSupport = true
* code.coding[ICD9].system 1.. MS
* code.coding[ICD9].system = "http://terminology.hl7.org/CodeSystem/icd9cm" (exactly)
* code.text 1..
* code.text ^comment = "Required for each submitted problem or condition String: Max Character length (100)"
* subject only Reference(PatientPSAB)
* subject.reference 1..1 MS
* onset[x] MS
* onsetDateTime MS
* onsetDateTime ^comment = "YYYY-MM-DD format. Partial dates (YYYY only or YYYY-MM only) are accepted."
* note ^comment = "Optional String: Max Character length (2000)"


Invariant: psab-con-1
Description: "If Condition.code.coding exists, then at least one coding shall be from the ICD9CM ValueSet"
* severity = #error
* expression = "coding.exists() implies $this.memberOf('http://fhir.infoway-inforoute.ca/io/psca/ValueSet/ICD9CM')"