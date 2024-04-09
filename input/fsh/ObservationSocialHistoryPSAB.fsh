Alias:  $ObsCatCd = http://terminology.hl7.org/CodeSystem/observation-category 
Alias: $ObservationSocialHistoryPSCA = http://fhir.infoway-inforoute.ca/io/psca/StructureDefinition/observation-socialhistory-ca-ps

Profile: ObservationSocialHistoryPSAB
Parent:  $ObservationSocialHistoryPSCA
Id:    ObservationSocialHistoryPSAB
Title: "Social History Observation (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR Observation (Social History) resource for use in Alberta Patient Summaries (PS-AB). It re-profiles the PS-CA Social History (General) profile and refines constraints applied to the Observation (Social History) resource when used in the PS-AB Composition profile."

* ^status = #draft 
* . ^comment = "Observation (Social History) resources included in Alberta Patient Summary Document Bundles SHALL NOT contain any of the following Observation details: basedOn, partOf, focus, encounter, hasMember, and derivedFrom. These rules are mechanically enforced through invariants at the PS-AB Bundle level."

//held back note.author and note.time constraints until it could be confirmed that these are error driven requirements rather than an indication they wouldn't be tested

* status MS
* category[social-history] ^sliceIsConstraining = true
* category[social-history] MS
* category[social-history].coding MS
* category[social-history].coding.system MS
* category[social-history].coding.system ^comment = "Fixed system value of 'http://terminology.hl7.org/CodeSystem/observation-category'"
* category[social-history].coding.code MS
* category[social-history].coding.code ^comment = "Fixed code value of 'social-history'"
* code MS
* code.text 1..1 MS
* code.text ^comment = "Text string describing the risk factor or type of observation"
* subject only Reference(PatientPSAB) 
* subject.reference 1..1 
* effective[x] MS
* effective[x] ^comment = "Required for each lifestyle factor submitted. YYYY-MM-DD format. Partial dates (YYYY only or YYYY-MM only) are accepted."
* effectiveDateTime MS
* effectiveDateTime ^comment = "YYYY-MM-DDThh:mm:ss[+|-]ZZ:ZZ  e.g.,: 1980-05-31T12:23:12-05:00" 
* performer only Reference(PractitionerRolePSAB or PractitionerPSAB or Organization or CareTeam or Patient or RelatedPerson)
* value[x] MS
* valueString MS
* valueString ^comment = "If value is populated (desired over note), it is expected to be populated in string format"
* note 
* note ^short = "Lifestyle Risk Factor Notes"
