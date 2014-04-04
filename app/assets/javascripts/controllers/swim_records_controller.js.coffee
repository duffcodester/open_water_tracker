@comsatrack.controller 'SwimRecordsCtrl', ['$scope', 'SwimRecords',
  @SwimRecordsCtrl = ($scope, SwimRecords) ->

    $scope.predicate =
      value: 'check_in'

    $scope.alerts = []

    $scope.addAlert = (swimRecord) ->
      $scope.alerts = []
      $scope.alerts.push
        type: "danger"
        msg: "#{swimRecord.swimmer.first_name}
              #{swimRecord.swimmer.middle_initial}
              #{swimRecord.swimmer.last_name} has been checked out!"

    $scope.closeAlert = (index) ->
      $scope.alerts.splice index, 1

    SwimRecords.index (data) ->
      $scope.SwimRecords = data
]
