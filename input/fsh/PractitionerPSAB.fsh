Alias: $PractitionerCA = http://hl7.org/fhir/ca/baseline/StructureDefinition/profile-practitioner
Alias: $IdentifierTypeCodes = http://hl7.org/fhir/ValueSet/identifier-type

Profile: PractitionerPSAB
Parent:  $PractitionerCA
Id:     PractitionerPSAB
Title: "Practitioner (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR Practitioner resource for use in Alberta Patient Summaries (PS-AB). It includes constraints that represent the minimum expectations for the Practitioner resource when used in the PS-AB Composition profile or in one of the referred resources."

//Outstanding //1. Confirm approach for support of limited identifier types for AB (e.g., LN, PRN) //2. May need to change the binding for .commmunication to AB language standard

* ^status = #draft 
* . ^comment = "Practitioner resources included in Alberta Patient Summary Document Bundles SHALL NOT contain any of the following Practitioner details: name period, photo, and qualification. These rules are mechanically enforced through invariants at the PS-AB Bundle level."


* identifier 1..* MS
* identifier ^comment = "Identifier is mandatory to support for Practitioners acting as authors for Patient Summaries in Alberta"
* identifier.type 1..1 MS
* identifier.type ^comment = "Identifier type is mandatory for each identifier supplied for authoring practitioners. Initial list of types to be supported from Reference set: Provider Identifier Type Codes: Practitioner ID (issued by AH), CPSA ID, CRNA ID, HSPID, CC ID (Connect Care)."
* identifier.value 1..1 MS 
* identifier.value ^comment = "Max length: 20 characters; Allowed characters: Number, alphabetic (upper or lower case), space, hyphen"
* identifier.system 1..1 MS
* identifier.assigner 1..1 MS
* identifier.assigner ^comment = "Identifier assigner is mandatory for each identifier supplied. Initial list of assigner values to be supported can be found in the Reference set: Provider Identifier Issuing Authority Codes"
* identifier.assigner.display ^comment = "Systems may use reference.display to provide the assigner information as a string value matching the supplied Reference set: Provider Identifier Issuing Authority Codes"

//Note: PDD has .identifier.system and .identifier.value as 1..1, however no need to set here as already 1..1 in CA Baseline

* name 1.. MS
* name.text 1.. MS
* name.family 1.. MS
* name.family ^comment = "Max length: 75 characters"
* name.given 1.. MS
* name.given ^comment = "First name is mandatory; Middle name is optional; Max length: 75 characters"



//Create a slice for name to set constraints for Official  (this has been commented out as it is not expressed in the PDD and has significant implications to fixing a mandatory use code)
//* name ^slicing.discriminator.type = #value
//* name ^slicing.discriminator.path = "use"
//* name ^slicing.rules = #open
//* name contains Official 1..1
//* name[Official].use = #official
//* name[Official].family 1..1
//* name[Official].given 1..*
