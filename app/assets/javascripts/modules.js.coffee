@comsatrack= angular.module 'comsatrack',
  ['ngResource', 'comsatrackFilters', 'xeditable']

@comsatrackFilters = angular.module 'comsatrackFilters', []

comsatrack.run (editableOptions, editableThemes) ->
  editableThemes.bs3.inputClass = "input-sx"
  editableThemes.bs3.buttonsClass = "btn-sm"
  editableOptions.theme = "bs3"
  return



