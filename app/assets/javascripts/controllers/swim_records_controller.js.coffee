@weowepro.controller 'SwimRecordsCtrl', ['$scope', 'SwimRecords',
  @WeoweFormsCtrl = ($scope, SwimRecords) ->

    $scope.predicate =
      value: 'check_in'

    SwimRecords.index (data) ->
      $scope.SwimRecords = data
]
