@comsatrack.controller 'SwimRecordsCtrl', ['$scope', 'SwimRecords',
  @SwimRecordsCtrl = ($scope, SwimRecords) ->

    this.parseInt = parseInt;

    $scope.predicate =
      value: 'check_in'

    SwimRecords.index (data) ->
      $scope.SwimRecords = data
]
