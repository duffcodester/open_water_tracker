@comsatrack.factory 'Application', [
  '$window'

  ($window) ->
    class Application
      angular.extend @, $window.Application
]
