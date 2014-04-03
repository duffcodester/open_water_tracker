@comsatrack.directive 'checkOut', ->
  restrict: 'E'
  templateUrl: '/check_out'
  scope:
    swimmerInfo: '=info'


  link: (scope, element, attrs) ->
    element.bind 'click', ->
      scope.swimmerInfo.completed = true
      # scope.swimmerInfo.$save()

      # post to server with completed true
      # set client object to server response



      # ng-click='deleteRow(swimRecord)'
