@comsatrack.directive 'checkOut', ->
  restrict: 'E'
  templateUrl: '/check_out'
  scope:
    swimRecord: '=info'

  link: (scope, element, attrs) ->
    element.bind 'click', ->
      scope.swimRecord.completed = true

      scope.swimRecord.$update (newSwimRecord, putResponseHeaders) ->
        console.log 'Great Success!'
        console.log newSwimRecord

      element.hide()

      # scope.swimRecord = newSwimRecord
      # post to server with completed true
      # set client object to server response
      # ng-click='deleteRow(swimRecord)'
