@comsatrack = angular.module 'comsatrack',
  ['ngResource',
   'comsatrackFilters',
   'googlechart',
   'ui.bootstrap']

.config ($httpProvider) ->
  authToken = $('meta[name="csrf-token"]').attr('content')
  $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = authToken

@comsatrackFilters = angular.module 'comsatrackFilters', []
