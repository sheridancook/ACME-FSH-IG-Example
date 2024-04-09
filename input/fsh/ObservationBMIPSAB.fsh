Alias: $ObservationBMI	= http://hl7.org/fhir/StructureDefinition/bmi  

Profile: ObservationBMIPSAB 
Parent: $ObservationBMI
Id:     ObservationBMIPSAB
Title: "ObservationBMI (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR Observation (BMI) resource for use in Alberta Patient Summaries (PS-AB). It re-profiles the HL7 FHIR BMI Profile and refines constraints applied to the Observation (BMI) resource when used in the PS-AB Composition profile."
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
* code.coding[BMICode] ^sliceIsConstraining = true
* code.coding[BMICode] 1.. MS
* code.coding[BMICode].system MS
* code.coding[BMICode].system ^comment = "Fixed value of 'http://loinc.org"
* code.coding[BMICode].code MS
* code.coding[BMICode].code ^comment = "Fixed value of '39156-5'"
* subject only Reference(PatientPSAB) 
* subject.reference 1..1 
* effective[x] MS
* effective[x] ^comment = "Required for each measured observation value submitted"
* effectiveDateTime MS
* effectiveDateTime ^comment = "YYYY-MM-DDThh:mm:ss[+|-]ZZ:ZZ  e.g.,: 1980-05-31T12:23:12-05:00" 
* value[x] 1..1 MS
* valueQuantity MS
* valueQuantity ^comment = "If BMI observation is submitted it shall have an observation value" 
* valueQuantity.value MS
* valueQuantity.value ^comment = "If BMI observation is submitted it shall contain Numeric (integer) - Max Character length (3)" 
* valueQuantity.unit MS
* valueQuantity.unit ^comment = "Required if BMI is submitted. Full text or abbreviation (e.g., ft, feet, in, inches, cm, centimeters, etc.)" 
* valueQuantity.system MS
* valueQuantity.system ^comment = "Fixed system value of 'http://unitsofmeasure.org" 
* valueQuantity.code MS
* valueQuantity.code ^comment = "Fixed code value of 'kg/m2" 




