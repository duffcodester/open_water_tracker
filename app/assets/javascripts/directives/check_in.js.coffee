@comsatrack.directive 'checkIn', ->
  restrict: 'E'
  templateUrl: '/check_in'
  scope:
    swimmer: '=info'

  link: (scope, element, attrs) ->
    element.bind 'click', ->

      scope.swimmer.$save (newSwimmer, putResponseHeaders) ->
        console.log 'New Swim Record Created!'
        console.log newSwimRecord
