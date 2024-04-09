Alias: $CompositionPSCA = http://fhir.infoway-inforoute.ca/io/psca/StructureDefinition/composition-ca-ps
Alias:  $V3Confidentiality = http://terminology.hl7.org/CodeSystem/v3-Confidentiality
Alias:  $data-absent-reason = http://hl7.org/fhir/StructureDefinition/data-absent-reason
Alias: $individual-recordedSexOrGenderAB = http://hl7.org/fhir/StructureDefinition/individual-recordedSexOrGender

Profile: CompositionPSAB
Parent:  $CompositionPSCA
Id:     CompositionPSAB
Title: "Composition (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR Composition resource for use in Alberta Patient Summaries (PS-AB). It re-profiles the PS-CA Composition profile and refines constraints applied to the Composition resource by the PS-CA project. 

A Canadian Patient Summary (PS-CA) document is an electronic health record extract containing essential healthcare information about a subject of care. It is informed by the IPS-UV Composition profile, but differs in its application of MS flags on some of the sections to allow for jurisdictional implementers flexibility in what sections systems must support in order to show conformance to their respective patient summaries. The PS-CA dataset is minimal and non-exhaustive; specialty-agnostic and condition-independent; but still clinically relevant. Its informed by the requirements specified in EN 17269 and ISO/DIS 27269, it is designed for supporting the international use case scenario for ‘unplanned, cross border care’, but is also designed to support a variety of use cases for cross-jurisdiction exchange. It is intended to guide implementation nationally while ensuring international exchange of patient summaries is not impeded.

This profile is based on the ClinicalDocument profile from the base R4 FHIR standard."
* ^status = #draft

* obeys psab-comp-1
* obeys psab-comp-2
* identifier 1..1 MS
* identifier ^comment = "Must be UUID or equivalent identifier to ensure uniqueness across all patient summary submissions"
* status  
* status ^comment = "Final = first submission of a newly curated summary
Amended = modification to a previously curated and submitted summary
Entered-in-error = previously submitted summary that is to be removed from the patient's record, as it was entered/submitted in error (wrong patient, unintended submission, etc.)
Preliminary - NOT USED IN ALBERTA"
* subject 
* subject only Reference(PatientPSAB) 
* subject.reference 1..1 MS
* date  
* author 1..*
* author only Reference(PractitionerPSAB or PractitionerRolePSAB or PatientPSAB or Device  or RelatedPerson)
* author.reference 1..1
* title 
* title = "Patient Summary - AB"
* confidentiality MS
* confidentiality = $V3Confidentiality#R
//* attester//this has been commented out while waiting for PS-CA 1.1 to relax the MS on composition.attester
//* attester.extension ^slicing.discriminator.type = #value
//* attester.extension ^slicing.discriminator.path = "url"
//* attester.extension ^slicing.description = "Extensions are always sliced by (at least) url"
//* attester.extension ^slicing.rules = #open
//* attester.extension contains $data-absent-reason named data-absent-reason 1..1 MS
//* attester.extension[data-absent-reason] ^short = "attester absence reason"
//* attester.extension[data-absent-reason] ^definition = "Provides a reason why the attester is missing."
//* attester.extension[data-absent-reason] ^comment = "Alberta Patient Summaries are not permitted to have a value outside of data absent reason for the attester element. Implementers are expected to demonstrate they can supply a 'not-permitted' value for this context"
* custodian 1..1 
* custodian.display = "Alberta Health" 
* custodian.display ^comment = "AH is responsible for the maintenance of the data (versions, archive rules, etc), not the maintenance of the content"
* type 
* section[sectionMedications] MS
  * title = "Medication Summary"
  * text ^comment = "Systems creating patient summaries are required to populate section.text (IPS conformance requirement - see All Slices), Alberta patient summary pilot systems MAY populate this information with non-meaningful content (e.g., duplicated title text) until/unless further guidance is established for how systems should populate should approach text for cross-border use (e.g., generated automatically with structured data, manually entered)"
  * entry[medicationStatement]  MS
  * entry[medicationStatement] only Reference(MedicationStatementPSAB) 
  * emptyReason  MS 
* section[sectionAllergies] MS
  * title = "Allergies and Intolerances"
  * text ^comment = "Systems creating patient summaries are required to populate section.text (IPS conformance requirement - see All Slices), Alberta patient summary pilot systems MAY populate this information with non-meaningful content (e.g., duplicated title text) until/unless further guidance is established for how systems should populate should approach text for cross-border use (e.g., generated automatically with structured data, manually entered)"
  * entry[allergyOrIntolerance]   MS
  * entry[allergyOrIntolerance] only Reference(AllergyIntolerancePSAB) 
  * emptyReason MS   
* section[sectionProblems] MS
  * title = "Problem List" 
  * text ^comment = "Systems creating patient summaries are required to populate section.text (IPS conformance requirement - see All Slices), Alberta patient summary pilot systems MAY populate this information with non-meaningful content (e.g., duplicated title text) until/unless further guidance is established for how systems should populate should approach text for cross-border use (e.g., generated automatically with structured data, manually entered)"
  * entry[problem]   MS
  * entry[problem] only Reference(ConditionPSAB)
  * emptyReason MS 
* section[sectionProceduresHx] MS
  * title = "History of Procedures" 
  * text  1..1 MS 
  * text ^comment = "When this section is shared in an Alberta Patient Summary, information on procedures is expected to be conveyed under section.text (rather than as a Procedure FHIR resource in section.entry)"
* section[sectionVitalSigns] MS
  * title = "Vital Signs" 
  * text ^comment = "Systems creating patient summaries are required to populate section.text (IPS conformance requirement - see All Slices), Alberta patient summary pilot systems MAY populate this information with non-meaningful content (e.g., duplicated title text) until/unless further guidance is established for how systems should populate should approach text for cross-border use (e.g., generated automatically with structured data, manually entered)"
  * entry[BMI]         MS      
  * entry[BMI]        only Reference(ObservationBMIPSAB)
  * entry[BodyWeight]  MS
  * entry[BodyWeight] only Reference(ObservationBodyWeightPSAB)  
  * entry[BodyHeight]  MS
  * entry[BodyHeight] only Reference(ObservationBodyHeightPSAB)
  * entry[HeadCircum]  MS
  * entry[HeadCircum] only Reference( ObservationHeadCircumPSAB) 
* section[sectionSocialHistory] MS
  * title = "Social History" 
  * text ^comment = "Systems creating patient summaries are required to populate section.text (IPS conformance requirement - see All Slices), Alberta patient summary pilot systems MAY populate this information with non-meaningful content (e.g., duplicated title text) until/unless further guidance is established for how systems should populate should approach text for cross-border use (e.g., generated automatically with structured data, manually entered)"  
  * entry[generalSocialHistory]  MS
  * entry[generalSocialHistory] only Reference(ObservationSocialHistoryPSAB) 
* section[sectionFamilyHistory]  MS
  * title = "Family History" 
  * text ^comment = "Systems creating patient summaries are required to populate section.text (IPS conformance requirement - see All Slices), Alberta patient summary pilot systems MAY populate this information with non-meaningful content (e.g., duplicated title text) until/unless further guidance is established for how systems should populate should approach text for cross-border use (e.g., generated automatically with structured data, manually entered)"  
  * entry[FamilyMemberHistory]  MS
  * entry[FamilyMemberHistory] only Reference(FamilyMemberHistoryPSAB) 


Invariant: psab-comp-1
Description: "If Composition.title is Patient Summary - AB, then the following elements SHALL NOT be present: attester, relatesTo, and event"
* severity = #error
* expression = "Composition.title = 'Patient Summary - AB' implies attester.exists().not() and relatesTo.exists().not() and event.exists().not()"

Invariant: psab-comp-2
Description: "If Composition.title is Patient Summary - AB, then the following sections SHALL NOT be present: sectionImmunizations, sectionMedicalDevices, sectionResults, sectionPastIllnessHx, sectionFunctionalStatus, sectionPlanOfCare, sectionPregnancyHx, sectionAdvanceDirectives"
* severity = #error
* expression = "Composition.title = 'Patient Summary - AB' implies section.code.coding.where(code = '11369-6').exists().not() and section.code.coding.where(code = '46264-8').exists().not() and section.code.coding.where(code = '30954-2').exists().not() and section.code.coding.where(code = '11348-0').exists().not() and section.code.coding.where(code = '47420-5').exists().not() and section.code.coding.where(code = '18776-5').exists().not() and section.code.coding.where(code = '10162-6').exists().not() and section.code.coding.where(code = '42348-3').exists().not()"