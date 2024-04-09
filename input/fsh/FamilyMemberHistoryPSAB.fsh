Alias: $FamilyMemberHistoryPSCA = http://fhir.infoway-inforoute.ca/io/psca/StructureDefinition/familymemberhistory-ca-ps

Profile: FamilyMemberHistoryPSAB
Parent: $FamilyMemberHistoryPSCA
Id:     FamilyMemberHistoryPSAB
Title: "FamilyMemberHistory (PS-AB)"
Description: "This profile defines a set of constraints to the FHIR FamilyMemberHistory resource for use in Alberta Patient Summaries (PS-AB). It re-profiles the PS-CA FamilyMemberHistory profile and refines the constraints that represent the minimum expectations for the FamilyMemberHistory resource when used in the PS-AB Composition profile."
* ^status = #draft

* obeys psab-fhs-1

//held back invariant constraints on FamilyMemberHistory.note and FamilyMemberHistory.condition.note (and their sub-elements) because of rules in the PDD implying that note.text (or condition.note.text) be populated. Assuming this means the current 0..0 on those sub-elements in the PDD implies they won't be tested

* . ^comment = "FamilyMemberHistory resources included in Alberta Patient Summary Document Bundles SHALL NOT contain any of the following FamilyMemberHistory details: dataAbsentReason, date, name, sex, born[x], age[x], estimatedAge, deceased[x], reasonCode, and reasonReference. These rules are mechanically enforced through invariants at the PS-AB Bundle level."

* status MS
* patient only Reference(PatientPSAB)  
* patient.reference 1..1 MS
* relationship MS
* relationship.text 1..1 MS
* relationship.text ^comment = "The full label of the family relationship (e.g., 'brother', 'sister', 'grandmother', etc.). Abbreviations are not allowed, to avoid confusion or misinterpretation. String: Max Character length (20) Required if a family history condition or characteristic is submitted."
* note MS 
* note ^comment = "Some form of note is required if family history data is being submitted. FamilyMemberHistory.note is used when the note cannot be distinctly tied to the condition property (i.e., familyMemberHistory.condition.note)."
* note.text MS 
* note.text ^comment = "Required if FamilyMemberHistory.note is populated. String: Max Character length (2000)"
* condition MS
* condition.onset[x] 1.. MS
* condition.onset[x] ^comment = "Required if a family history condition or characteristic is submitted. May contain a number (age or year), or a textual description of an age, age range or life stage. String: Max Character length (50)"
//did not apply sliced data type pattern given PDD business rule that implies that age, range, period, or string are all expected.
* condition.note MS
* condition.note.text MS
* condition.note.text ^comment = "Required if FamilyMemberHistory.condition.note is populated. String: Max Character length (2000)"

Invariant: psab-fhs-1
Description: "If FamilyMemberHistory is submitted, it must include either FamilyMemberHistory.note or FamilyMemberHistory.condition.note"
* severity = #error
* expression = "note.exists() or condition.note.exists()"