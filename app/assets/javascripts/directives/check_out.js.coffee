@comsatrack.directive 'checkOut', ->
  restrict: 'E'
  scope:
    swimmerInfo: '=info'
  # template: 'Id: {{swimmerInfo.swimmer.id}}'
  templateUrl: '/check_out'
  link: (scope, element, attrs) ->
    scope.actionUrl = "/swim_records/#{scope.swimmerInfo.swimmer.id}"
