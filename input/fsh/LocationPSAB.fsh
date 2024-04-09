Alias: $Location = http://hl7.org/fhir/ca/baseline/StructureDefinition/profile-location
Alias: $IdentType = http://hl7.org/fhir/ValueSet/identifier-type
Alias: $ContactPointSystemR4 = https://simplifier.net/packages/hl7.fhir.r4.core/4.0.1/files/83082

Profile: LocationPSAB
Parent:  $Location
Id:     LocationPSAB
Title: "Location (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR Location resource for use in Alberta Patient Summaries (PS-AB). It includes constraints that represent the minimum expectations for the Location resource when used in the PS-AB Organization profile or in one of the referred resources."
* ^status = #draft
* . ^comment = "Location resources included in Alberta Patient Summary Document Bundles SHALL NOT contain any of the following Location details: telecom.use, position, and endpoint. These rules are mechanically enforced through invariants at the PS-AB Bundle level."


* identifier 1.. MS
* identifier.value 1..1 MS
* identifier.value ^comment = "Must be a valid provincially-assigned delivery site identifier (Site WDFA key, AH Billing ID, or other approved identifier)"
* identifier.type 1..1 MS
* identifier.type ^comment = "Must be a valid delivery site type ('domain') associated to the submitted identifier value 'AHWFACID' for AH Billing ID type, 'DPHIEXSTKID' for site WDFA key type"
//* identifier.type from $IdentType (extensible)
* status ^comment = "'Active' recommended (but not required)"
* name 1..1 MS
* name ^comment = "Max Character length (100)"
//Slice telecom to have mandatory phone and optional fax
* telecom 1.. MS
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom contains Phone 1..* MS and Fax 0..*
* telecom[Phone].value 1..1 MS
* telecom[Phone].value ^comment = "Formatted as: #-###-###-####"
* telecom[Phone].system 1..1 MS
* telecom[Phone].system = #phone
* telecom[Fax].value 1..1 MS
* telecom[Fax].value ^comment = "Formatted as: #-###-###-####"
* telecom[Fax].system 1..1 MS
* telecom[Fax].system = #fax
* address 1..1 MS
* address.line 1.. MS
* address.city 1.. MS
* address.city ^comment = "Max Character length (100)"
* address.state 1.. MS
* address.state ^comment = "Canadian Province/Territory Codes"
* address.country 1.. MS
* address.postalCode 1.. MS
* address.postalCode ^comment = "Must be valid Canadian alphanumeric (A/N) postal code formatted as: ANA NAN"