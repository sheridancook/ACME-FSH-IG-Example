Alias: $individual-recordedSexOrGenderAB = http://hl7.org/fhir/StructureDefinition/individual-recordedSexOrGender
Alias: $RecordedSexandGenderType = https://fhir.alberta.ca/fhir/CodeSystem/RecordedSexandGenderType
Alias: $PatientPSCA = http://fhir.infoway-inforoute.ca/io/psca/StructureDefinition/patient-ca-ps
Alias: $CodeSysIdentifierType = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $CodeSysIdentifierTypeAB = https://fhir.alberta.ca/fhir/ValueSet/identifier-type-ab

Profile: PatientPSAB
Parent: $PatientPSCA
Id:    PatientPSAB
Title: "Patient (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR Patient resource for use in Alberta Patient Summaries (PS-AB). It re-profiles the PS-CA Patient profile and refines constraints applied to the Patient resource by the PS-CA project to represent the minimum expectations for the Patient resource when used in the PS-AB Composition profile or in one of the referred resources."
* ^status = #draft
* . ^comment = "Patient resources included in Alberta Patient Summary Document Bundles SHALL NOT contain any of the following Patient details: text, active, name.period, address.text, maritalStatus, multipleBirth, photo, contact.address, contact.gender, contact.organization, contact.period, communication, generalPractitioner, managingOrganization. These rules are mechanically enforced through invariants at the PS-AB Bundle level."

* extension 1..
* extension[individual-recordedSexOrGender] 1.. MS
* extension[individual-recordedSexOrGender] only $individual-recordedSexOrGenderAB
* extension[individual-recordedSexOrGender] ^sliceName = "individual-recordedSexOrGender"
* extension[individual-recordedSexOrGender] ^short = "Extension for representing an individuals recorded sex or gender."
* extension[individual-recordedSexOrGender] ^definition = "Recorded sex or gender (RSG) information includes the various sex and gender concepts that are often used in existing systems but are known NOT to represent a gender identity, sex parameter for clinical use, or attributes related to sexuality, such as sexual orientation, sexual activity, or sexual attraction. Examples of recorded sex or gender concepts include administrative gender, administrative sex, and sex assigned at birth. When exchanging this concept, refer to the guidance in the Gender Harmony Implementation Guide"
* identifier 1.. MS
* identifier[JHN] 1.. MS
* identifier[JHN] ^sliceIsConstraining = true
* identifier[JHN] ^comment = "Patients must have at least an AB ULI identifier or another provincial JHN identifier. Implementers supplying ULIs shall use identifier.system of https://fhir.infoway-inforoute.ca/NamingSystem/ca-ab-patient-healthcare-id"
* name.text 1..
* name 1..*
* name.text 1..1  MS
* name.text ^comment = "Mandatory String: Max Character length: 200"
* name.family 1..1 MS
//* name.family ^comment = "Mandatory Allowed characters: Alphabet (upper or lower case), apostrophe, hyphen, comma, space. Extended characters must be encoded. String: Max Character length (75)"
* name.given 0..* MS 
* telecom 1..* MS
* telecom ^slicing.discriminator.type = #pattern
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom contains
    Phone 1..* 
* telecom[Phone].system = #phone (exactly)
* gender.extension ^slicing.discriminator.type = #value
* gender.extension ^slicing.discriminator.path = "url"
* gender.extension ^slicing.description = "Extensions are always sliced by (at least) url"
* gender.extension ^slicing.rules = #open
* gender.extension contains $data-absent-reason named data-absent-reason 1..1 MS
* gender.extension[data-absent-reason] ^short = "element absence reason"
* gender.extension[data-absent-reason] ^definition = "Provides a reason why the element is missing."
* gender.extension[data-absent-reason] ^comment = "Alberta Patient Summaries are not permitted to have a value outside of data absent reason for the gender element, given that recorded gender is to be conveyed in the individual-recordedSexOrGender extension to account for additional values in use in Alberta. Implementers are expected to demonstrate they can supply a 'not-permitted' value for this context"
* birthDate MS
* address 0..* MS
* address.type ^comment = "Valid values: postal / physical / both. Assumed to be 'both' if no value is provided"
* address.use ^comment =  "Assumed to be current home address if Address is present but no Use value is provided"
* address.line 1..*
* address.city 1..1
* address.state 1..1
* address.postalCode 1..1
* contact.name 1..1

    