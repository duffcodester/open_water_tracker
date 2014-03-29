@comsatrack.controller 'RecordsCtrl', ['$scope', 'Records',
  @RecordsCtrl = ($scope, Records) ->

    $scope.predicate =
      value: 'check_in'

    Records.index (data) ->
      $scope.Records = data
]
