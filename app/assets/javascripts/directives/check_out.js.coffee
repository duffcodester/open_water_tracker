@comsatrack.directive 'checkOut', ->
  restrict: 'E'
  templateUrl: '/check_out'
  scope:
    swimRecord: '=info'

  link: (scope, element, attrs) ->
    element.bind 'click', ->
      scope.swimRecord.completed = true
      scope.swimmer.$update()

      scope.swimRecord.$update (newSwimRecord, putResponseHeaders) ->
        console.log 'Great Success!'
        console.log newSwimRecord
