Alias: $PractitionerRoleCA = http://hl7.org/fhir/ca/baseline/StructureDefinition/profile-practitionerrole   
Alias: $PracticeSettingCodeValueSet = http://hl7.org/fhir/ValueSet/c80-practice-codes

Profile: PractitionerRolePSAB
Parent:  $PractitionerRoleCA
Id:     PractitionerRolePSAB
Title: "PractitionerRole (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR PractitionerRole resource for use in Alberta Patient Summaries (PS-AB). It includes constraints that represent the minimum expectations for the PractitionerRole resource when used in the PS-AB Composition profile or in one of the referred resources."
* ^status = #draft
* . ^comment = "PractitionerRole resources included in Alberta Patient Summary Document Bundles SHALL NOT contain any of the following PractitionerRole details: endpoint. These rules are mechanically enforced through invariants at the PS-AB Bundle level."

* active = true
* active ^comment =  "If PractitionerRole.active is populated it must always be Active at the time of patient summary submission"
// Applying this rule at the resource level may make it more difficult to scale for enterprise use (registry use cases) - consider removing fixed value in any future generic profiles that will have registry coverage.

* practitioner 1..1 MS
* practitioner only Reference(PractitionerPSAB)
* practitioner.reference 1..1
* code 
* location 1.. MS
* location only Reference(LocationPSAB)
* location.reference 1..1
* specialty 1.. MS
* specialty from $PracticeSettingCodeValueSet (preferred)
* specialty ^comment = "Mandatory, Reference set: Provider Expertise Codes"

//The slicing below has been held back until there is confirmation whether submission of HealthcareService on PractitionerRole is expected to be a requirement for testing (because currently it's just optional and MS)
//* healthcareService ^slicing.discriminator.type = #profile
//* healthcareService ^slicing.discriminator.path = "$this.resolve()"
//* healthcareService ^slicing.rules = #open
//* healthcareService contains HealthcareServicePSAB 0.. MS
//* healthcareService[HealthcareServicePSAB] only Reference(HealthcareServicePSAB)






