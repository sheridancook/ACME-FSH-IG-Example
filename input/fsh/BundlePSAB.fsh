Alias: $BundlePSCA = http://fhir.infoway-inforoute.ca/io/psca/StructureDefinition/bundle-ca-ps

Profile: BundlePSAB
Parent:  BundlePSCA
Id:     BundlePSAB
Title: "Bundle (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR Bundle resource for use in Alberta Patient Summaries (PS-AB). It re-profiles the PS-CA Bundle profile and refines constraints applied to the Bundle resource by the PS-CA project to include hard constraints (invariants) than enforce what sections and resource elements are allowed to be present in an Alberta Patient Summary. These have been applied at the Bundle level as an alternative to forbidding elements through 0..0 cardinality - to balance the need for mechanical validation on Patient Summary against the re-use of clinical FHIR profiles under different contexts."
* ^status = #draft //Set the status of profile to draft


* obeys psab-bdl-pat-1
* obeys psab-bdl-pra-1
* obeys psab-bdl-loc-1
* obeys psab-bdl-prr-1
* obeys psab-bdl-mes-1
* obeys psab-bdl-ait-1
* obeys psab-bdl-con-1
* obeys psab-bdl-obs-1
* obeys psab-bdl-obs-vs-1
* obeys psab-bdl-obs-sh-1
//* obeys psab-bdl-obs-vs-2
* obeys psab-bdl-fhs-1



Invariant: psab-bdl-pat-1
Description: "If Bundle.Composition.title is Patient Summary - AB, then the following Patient details SHALL NOT be present: text, active, name.period, address.text, maritalStatus, multipleBirth, photo, contact.address, contact.gender, contact.organization, contact.period, communication, generalPractitioner, managingOrganization"
* severity = #error
* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies Bundle.entry.where(resource is Patient).resource.where(text.exists()).exists().not() and Bundle.entry.where(resource is Patient).resource.where(active.exists()).exists().not() and Bundle.entry.where(resource is Patient).resource.where(name.period.exists()).exists().not() and Bundle.entry.where(resource is Patient).resource.where(address.text.exists()).exists().not() and Bundle.entry.where(resource is Patient).resource.where(maritalStatus.exists()).exists().not() and Bundle.entry.where(resource is Patient).resource.where(multipleBirth.exists()).exists().not() and Bundle.entry.where(resource is Patient).resource.where(photo.exists()).exists().not() and Bundle.entry.where(resource is Patient).resource.where(contact.address.exists()).exists().not() and Bundle.entry.where(resource is Patient).resource.where(contact.gender.exists()).exists().not() and Bundle.entry.where(resource is Patient).resource.where(contact.organization.exists()).exists().not() and Bundle.entry.where(resource is Patient).resource.where(contact.period.exists()).exists().not() and Bundle.entry.where(resource is Patient).resource.where(communication.exists()).exists().not() and Bundle.entry.where(resource is Patient).resource.where(generalPractitioner.exists()).exists().not() and Bundle.entry.where(resource is Patient).resource.where(managingOrganization.exists()).exists().not()"

Invariant: psab-bdl-pra-1
Description: "If Bundle.Composition.title is Patient Summary - AB, then the following Practitioner details SHALL NOT be present: name period, photo, and qualification"
* severity = #error
* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies Bundle.entry.where(resource is Practitioner).resource.where(name.period.exists()).exists().not() and Bundle.entry.where(resource is Practitioner).resource.where(photo.exists()).exists().not() and Bundle.entry.where(resource is Practitioner).resource.where(qualification.exists()).exists().not()"

Invariant: psab-bdl-loc-1
Description: "If Bundle.Composition.title is Patient Summary - AB then the following Location details SHALL NOT be present: telecom.use, position, and endpoint"
* severity = #error
* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies Bundle.entry.where(resource is Location).resource.where(telecom.use.exists()).exists().not() and Bundle.entry.where(resource is Location).resource.where(position.exists()).exists().not() and Bundle.entry.where(resource is Location).resource.where(endpoint.exists()).exists().not()"

Invariant: psab-bdl-prr-1 
Description: "If Bundle.Composition.title is Patient Summary - AB, then the following PractitionerRole details SHALL NOT be present: endpoint"
* severity = #error
* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies Bundle.entry.where(resource is PractitionerRole).resource.where(endpoint.exists()).exists().not()"


//the original expression ("Bundle.entry.where(resource is Composition).resource.where(title ~ 'Patient Summary - AB').exists() implies Bundle.entry.where(resource is PractitionerRole).resource.endpoint.where($this.exists() ).exists().not()") should work, I did some preliminary testing but it would need to be further tested. I have kept the patterning inline with the other invariants above. This should be evaluated against other optimization choices.

Invariant: psab-bdl-mes-1
Description: "If Bundle.Composition.title is Patient Summary - AB, then the following MedicationStatement details SHALL NOT be present: statusReason, context, dateAsserted, informationSource, derivedFrom, reasonReference, dosage.site, dosage.method, dosage.doseAndRate.type, dosage.doseAndRate.rate[x], dosage.maxDosePerPeriod, dosage.maxDosePerAdministration, dosage.maxDosePerLifetime"
* severity = #error
* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies Bundle.entry.where(resource is MedicationStatement).resource.where(statusReason.exists()).exists().not() and Bundle.entry.where(resource is MedicationStatement).resource.where(context.exists()).exists().not() and Bundle.entry.where(resource is MedicationStatement).resource.where(dateAsserted.exists()).exists().not() and Bundle.entry.where(resource is MedicationStatement).resource.where(informationSource.exists()).exists().not() and Bundle.entry.where(resource is MedicationStatement).resource.where(derivedFrom.exists()).exists().not() and Bundle.entry.where(resource is MedicationStatement).resource.where(reasonReference.exists()).exists().not() and Bundle.entry.where(resource is MedicationStatement).resource.where(dosage.site.exists()).exists().not() and Bundle.entry.where(resource is MedicationStatement).resource.where(dosage.method.exists()).exists().not() and Bundle.entry.where(resource is MedicationStatement).resource.where(dosage.doseAndRate.type.exists()).exists().not() and Bundle.entry.where(resource is MedicationStatement).resource.where(dosage.maxDosePerPeriod.exists()).exists().not() and Bundle.entry.where(resource is MedicationStatement).resource.where(dosage.maxDosePerAdministration.exists()).exists().not() and Bundle.entry.where(resource is MedicationStatement).resource.where(dosage.maxDosePerLifetime.exists()).exists().not() and Bundle.entry.where(resource is MedicationStatement).resource.where(dosage.doseAndRate.rate.exists()).exists().not()"

Invariant: psab-bdl-ait-1 
Description: "If Bundle.Composition.title is Patient Summary - AB, then the following AllergyIntolerance details SHALL NOT be present: verificationStatus, encounter, asserter"
* severity = #error
* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies Bundle.entry.where(resource is AllergyIntolerance).resource.where(verificationStatus.exists()).exists().not() and Bundle.entry.where(resource is AllergyIntolerance).resource.where(encounter.exists()).exists().not() and Bundle.entry.where(resource is AllergyIntolerance).resource.where(asserter.exists()).exists().not()"

Invariant: psab-bdl-con-1
Description: "If Bundle.Composition.title is Patient Summary - AB, then the following Condition details SHALL NOT be present: verificationStatus, severity, encounter, abatement, recorder, asserter, stage, evidence"
* severity = #error
* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies Bundle.entry.where(resource is Condition).resource.where(verificationStatus.exists()).exists().not() and Bundle.entry.where(resource is Condition).resource.where(severity.exists()).exists().not() and Bundle.entry.where(resource is Condition).resource.where(encounter.exists()).exists().not() and Bundle.entry.where(resource is Condition).resource.where(abatement.exists()).exists().not() and Bundle.entry.where(resource is Condition).resource.where(recorder.exists()).exists().not() and Bundle.entry.where(resource is Condition).resource.where(asserter.exists()).exists().not() and Bundle.entry.where(resource is Condition).resource.where(stage.exists()).exists().not() and Bundle.entry.where(resource is Condition).resource.where(evidence.exists()).exists().not()"


Invariant: psab-bdl-obs-1
Description: "If Bundle.Composition.title is Patient Summary - AB, then the following vital sign observations SHALL NOT be present: body temperature, heart rate, oxygen saturation, respiratory rate, vital signs panel"
* severity = #error
* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies Bundle.entry.where(resource is Observation).resource.where(code.coding.code = '8310-5').exists().not() and Bundle.entry.where(resource is Observation).resource.where(code.coding.code = '8867-4').exists().not() and Bundle.entry.where(resource is Observation).resource.where(code.coding.code = '2708-6').exists().not() and Bundle.entry.where(resource is Observation).resource.where(code.coding.code = '9279-1').exists().not() and Bundle.entry.where(resource is Observation).resource.where(code.coding.code = '85353-1').exists().not()"


Invariant: psab-bdl-obs-vs-1
Description: "If Bundle.Composition.title is Patient Summary - AB, then the following vital sign observation details SHALL NOT be present: basedOn, partOf, category.extension, category.coding.extension, code.extension, focus, encounter, issued, value.extension, and dataAbsentReason."
* severity = #error
* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies Bundle.entry.where(resource is Observation).resource.where((basedOn or partOf or category.extension or category.coding.extension or code.extension or focus or encounter or issued or value.extension or dataAbsentReason) and category.coding.code = 'vital-signs').exists().not()"


//The elements below have been singled out from other reference type elements because they are more likely to show up in vital signs and would result in more impact to vendors who have configured for FHIR already. These therefore need to be further validated through clinical & technical working groups before being applied.

//Invariant: psab-bdl-obs-vs-2
//Description: "If Bundle.Composition.title is Patient Summary - AB, then the following vital sign observation details that link to other resources SHALL NOT be present: performer, hasMember, and derivedFrom"
//* severity = #error
//* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies Bundle.entry.where(resource is Observation).resource.where((performer or hasMember or derivedFrom) and category.coding.code = 'vital-signs').exists().not()"

Invariant: psab-bdl-obs-sh-1
Description: "If Bundle.Composition.title is Patient Summary - AB, then the following social history observation details SHALL NOT be present: basedOn, partOf, focus, encounter, hasMember, and derivedFrom"
* severity = #error
* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies Bundle.entry.where(resource is Observation).resource.where((basedOn or partOf or focus or encounter or hasMember or derivedFrom) and category.coding.code = 'social-history').exists().not()"

//held back constraints on specimen and device given that we already discussed in a previous pattern that these would be unlikely to show up in vitals or social history


Invariant: psab-bdl-fhs-1
Description: "If Bundle.Composition.title is Patient Summary - AB, then the following FamilyMemberHistory details SHALL NOT be present: dataAbsentReason, date, name, sex, born[x], age[x], estimatedAge, deceased[x], reasonCode, reasonReference"
* severity = #error
* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies Bundle.entry.where(resource is FamilyMemberHistory).resource.where(dataAbsentReason.exists()).exists().not() and Bundle.entry.where(resource is FamilyMemberHistory).resource.where(name.exists()).exists().not() and Bundle.entry.where(resource is FamilyMemberHistory).resource.where(sex.exists()).exists().not() and Bundle.entry.where(resource is FamilyMemberHistory).resource.where(born.exists()).exists().not() and Bundle.entry.where(resource is FamilyMemberHistory).resource.where(age.exists()).exists().not() and Bundle.entry.where(resource is FamilyMemberHistory).resource.where(estimatedAge.exists()).exists().not() and Bundle.entry.where(resource is FamilyMemberHistory).resource.where(deceased.exists()).exists().not() and Bundle.entry.where(resource is FamilyMemberHistory).resource.where(reasonCode.exists()).exists().not() and Bundle.entry.where(resource is FamilyMemberHistory).resource.where(reasonReference.exists()).exists().not()"

//held back invariant constraints on FamilyMemberHistory.note and FamilyMemberHistory.condition.note (and their sub-elements) because of rules in the PDD implying that note.text (or condition.note.text) be populated. Assuming this means the current 0..0 on those sub-elements in the PDD implies they are ignorable/won't be tested.

//held back invariant constraints things like instantiatesURi/canonical, meta, because the assumption is that those 0..0 in PDD are implying they are ignorable/non-testable (similar to the pattern that is applied elsewhere). 

//also used consolidated invariant pattern above for consistency, if AH team decides they'd like to split them up, the original split invariants for this resource can be found in the history of the text file on Simplifier. 

