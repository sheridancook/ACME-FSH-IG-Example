Alias: $ObservationBodyWeight = http://hl7.org/fhir/StructureDefinition/bodyweight 
Alias:  $ObsVitalsigWeightucumcode = http://hl7.org/fhir/ValueSet/ucum-bodyweight
Profile: ObservationBodyWeightPSAB
Parent: $ObservationBodyWeight
Id:     ObservationBodyWeightPSAB
Title: "ObservationBodyWeight (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR Observation (BodyWeight) resource for use in Alberta Patient Summaries (PS-AB). It re-profiles the HL7 FHIR BodyWeight Profile and refines constraints applied to the Observation (BodyWeight) resource when used in the PS-AB Composition profile."
* ^status = #draft 

* . ^comment = "Observation (Vital Sign) resources included in Alberta Patient Summary Document Bundles SHALL NOT contain any of the following Observation details: basedOn, partOf, category.extension, category.coding.extension, code.extension, focus, encounter, issued, value.extension, and dataAbsentReason. These rules are mechanically enforced through invariants at the PS-AB Bundle level."

* status = #final
* status ^comment = "Required for each measured observation value submitted"
* category MS
* category[VSCat] ^sliceIsConstraining = true
* category[VSCat] MS
* category[VSCat].coding MS
* category[VSCat].coding.system MS
* category[VSCat].coding.system ^comment = "Fixed system value of 'http://terminology.hl7.org/CodeSystem/observation-category'"
* category[VSCat].coding.code MS
* category[VSCat].coding.code ^comment = "Fixed code value of 'vital-signs'"
* code MS
* code.coding[BodyWeightCode] ^sliceIsConstraining = true
* code.coding[BodyWeightCode] 1.. MS
* code.coding[BodyWeightCode].system MS
* code.coding[BodyWeightCode].system ^comment = "Fixed value of 'http://loinc.org"
* code.coding[BodyWeightCode].code MS
* code.coding[BodyWeightCode].code ^comment = "Fixed value of '29463-7'"
* subject only Reference(PatientPSAB) 
* subject.reference 1..1 
* effective[x] MS
* effective[x] ^comment = "Required for each measured observation value submitted"
* effectiveDateTime MS
* effectiveDateTime ^comment = "YYYY-MM-DDThh:mm:ss[+|-]ZZ:ZZ  e.g.,: 1980-05-31T12:23:12-05:00" 
* value[x] 1..1 MS
* valueQuantity 1..1 MS
* valueQuantity ^comment = "If Body Weight observation is submitted it shall have an observation value" 
* valueQuantity.value MS
* valueQuantity.value ^comment = "Mandatory Numeric (integer)" 
* valueQuantity.unit MS
* valueQuantity.unit ^comment = "Mandatory full text or abbreviation (e.g., lb, pounds, kg, kilograms, etc.)"
* valueQuantity.system MS
* valueQuantity.system ^comment = "Fixed system value of 'http://unitsofmeasure.org" 
* valueQuantity.code MS



