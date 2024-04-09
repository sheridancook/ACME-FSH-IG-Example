Invariant: inv-isolate-1
Description: "If Bundle.Composition.title is Patient Summary - AB, then the following observations SHALL NOT be present"
* severity = #error
* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies Bundle.entry.where(resource is Observation).resource.where(code.coding.where(code = '8310-5')).exists().not()"

//* expression = "Bundle.entry.where(resource is Composition).resource.where(title = 'Patient Summary - AB') implies section.entry.where(resource is Observation).resource.where(code.coding.where(code = '8310-5').exists().not()"