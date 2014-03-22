@comsatrack.controller 'SwimRecordsCtrl', ['$scope', 'SwimRecords',
  @SwimRecordsCtrl = ($scope, SwimRecords) ->

    $scope.predicate =
      value: 'check_in'

    SwimRecords.index (data) ->
      $scope.SwimRecords = data
]
