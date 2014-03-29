@comsatrack.controller 'SwimRecordsCtrl', ['$scope', 'SwimRecords',
  @SwimRecordsCtrl = ($scope, SwimRecords) ->

    $scope.predicate =
      value: 'check_in'

    $scope.temp = false

    $scope.deleteRow = (row) ->
      $scope.SwimRecords.splice $scope.SwimRecords.indexOf(row), 1
      return

    $scope.isTemp = (i) ->
      i is $scope.SwimRecords.length - 1 and $scope.temp

    SwimRecords.index (data) ->
      $scope.SwimRecords = data
]
