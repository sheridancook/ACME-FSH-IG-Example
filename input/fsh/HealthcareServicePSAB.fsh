
Profile: HealthcareServicePSAB
Parent: HealthcareService
Id:     HealthcareServicePSAB
Title: "HealthcareService (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR HealthcareService resource for use in Alberta Patient Summaries (PS-AB). It refines constraints applied to the HealthcareService resource to represent the minimum expectations when used to convey delivery site details in the Patient Summary."
* . ^comment = "HealthcareService resources included in Alberta Patient Summary Document Bundles SHALL NOT contain any of the following HealthcareService details: photo. These rules are mechanically enforced through invariants at the PS-AB Bundle level."
* location 1..* MS
* location ^slicing.discriminator.type = #value
* location ^slicing.discriminator.path = "profile"
* location ^slicing.rules = #open
* location contains deliverSite 1..1 MS
* location[deliverSite].type = "Location"
* location[deliverSite].display ^comment = "This element describes the delivery site (a medical practice at a specific location), where the authoring provider curated the patient summary from the available medical chart."
* location[deliverSite]  only Reference(LocationPSAB)
