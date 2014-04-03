@comsatrack = angular.module 'comsatrack',
  ['ngResource', 'comsatrackFilters', 'xeditable']

.config ($httpProvider) ->
  authToken = $('meta[name="csrf-token"]').attr('content')
  $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = authToken

.run (editableOptions, editableThemes) ->
  editableThemes.bs3.inputClass = 'input-sx'
  editableThemes.bs3.buttonsClass = 'btn-sm'
  editableOptions.theme = 'bs3'

@comsatrackFilters = angular.module 'comsatrackFilters', []
