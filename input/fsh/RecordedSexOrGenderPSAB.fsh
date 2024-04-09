Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm
Alias: $individual-recordedSexOrGender = http://hl7.org/fhir/StructureDefinition/individual-recordedSexOrGender
Alias: $administrative-gender-ab = https://fhir.alberta.ca/fhir/ValueSet/administrative-gender-ab
Alias: $jurisdiction = http://hl7.org/fhir/ValueSet/jurisdiction

Extension: RecordedSexOrGenderAB
Parent: $individual-recordedSexOrGender
Id: individual-recordedSexOrGenderAB
Title: "Person Recorded Sex Or Gender AB Profile"
Description: "This extension re-profiles the PS-CA recordedSexOrGender extension to enable supply of recorded sex or recorded gender concepts in FHIR R4."
Context: Patient, RelatedPerson, Person, Practitioner
* ^status = #draft
* ^experimental = false
* ^date = "2022-01-28"
* ^publisher = "HL7 International / FHIR Infrastructure"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://hl7.org/Special/committees/fhir-i"
* ^jurisdiction = $m49.htm#001
* . ^short = "A recorded sex or gender property for the individual"
* . ^definition = "A sex or gender property for the individual from a document or other record"
* . ^min = 0
* extension[value] only Extension
* extension[value] ^short = "The recorded sex or gender property for the individual"
* extension[value] ^definition = "A sex or gender property for the individual from a document or other record"
* extension[value].url only uri
* extension[value].value[x] 1..
* extension[value].value[x] only CodeableConcept
* extension[value].value[x] from $administrative-gender-ab (required)
* extension[value].value[x] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[value].value[x] ^binding.extension.valueString = "recordedSexOrGender"
* extension[type] only Extension
* extension[type] ^short = "Type of recorded sex or gender."
* extension[type] ^definition = "The type or category of sex or gender that is recorded."
* extension[type] ^comment = "Because the recorded sex or gender concept exists primarily as means to exchange sex and gender data concepts that are known NOT to represent a gender identity, sex parameter for clinical use, or attributes related to sexuality, the type is used to identify what type of concept the recorded sex or gender concept is."
* extension[type].url only uri
* extension[type].value[x] 1..
* extension[type].value[x] only CodeableConcept
* extension[type].value[x] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[type].value[x] ^binding.extension.valueString = "recordedSexOrGenderType"
* extension[type].value[x].coding.code = #XCA04739-9 (exactly)
* extension[effectivePeriod] only Extension
* extension[effectivePeriod] ^short = "When the recorded sex or gender value applies"
* extension[effectivePeriod] ^definition = "The time period during which the recorded sex or gender value applies to the individual"
* extension[effectivePeriod].url only uri
* extension[effectivePeriod].value[x] ..1
* extension[effectivePeriod].value[x] only Period
* extension[acquisitionDate] only Extension
* extension[acquisitionDate] ^short = "When the sex or gender value was recorded."
* extension[acquisitionDate] ^definition = "The date/time when the sex or gender value was first recorded in the system."
* extension[acquisitionDate].url only uri
* extension[acquisitionDate].value[x] 1..
* extension[acquisitionDate].value[x] only dateTime
* extension[sourceDocument] only Extension
* extension[sourceDocument] ^short = "The document the sex or gender property was acquired from."
* extension[sourceDocument] ^definition = "The reference to the source document or the code representing the type of document where this sex or gender property is initially recorded."
* extension[sourceDocument] ^comment = "For example, if a driver's license is scanned, this property may reference that scanned document."
* extension[sourceDocument].url only uri
* extension[sourceDocument].value[x] 1..
* extension[sourceDocument].value[x] only Reference(DocumentReference)
* extension[sourceField] only Extension
* extension[sourceField] ^short = "The name of the field within the source document where this sex or gender property is initially recorded."
* extension[sourceField] ^definition = "The name of the field within the source document where this sex or gender property is initially recorded."
* extension[sourceField] ^comment = "For example, if a sex value is acquired from a driver's license, and the name of the field on that driver's license is 'SEX', then a code describing that field can be provided.  If the semantics of the field are known, they may be described in the comment.  For example, if the 'SEX' field on a license in a particular state or province is populated based on an individual's indication of what gender they consider themselves to be, but the field label is 'SEX' for historical reasons, a comment describing that the semantics of the field align with gender identity, even though the field name is 'SEX' can be provided."
* extension[sourceField].url only uri
* extension[sourceField].value[x] 1..
* extension[sourceField].value[x] only string
* extension[jurisdiction] only Extension
* extension[jurisdiction] ^short = "Who issued the document where the sex or gender was aquired"
* extension[jurisdiction] ^definition = "The jurisdiction or organization that issued the document from which the sex or gender was aquired"
* extension[jurisdiction] ^comment = "For example, a individual's driver's license or passport would be issued by a specific state or country."
* extension[jurisdiction].url only uri
* extension[jurisdiction].value[x] 1..
* extension[jurisdiction].value[x] only CodeableConcept
* extension[jurisdiction].value[x] from $jurisdiction (extensible)
* extension[jurisdiction].value[x] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[jurisdiction].value[x] ^binding.extension.valueString = "Jurisdiction ValueSet"
* extension[comment] only Extension
* extension[comment] ^short = "Context or source information about the recorded sex or gender"
* extension[comment] ^definition = "Further explanation about the context or source of the recorded sex or gender value"
* extension[comment].url only uri
* extension[comment].value[x] 1..
* extension[comment].value[x] only string
