@comsatrack.controller 'SwimRecordsCtrl', ['$scope', 'SwimRecords',
  @SwimRecordsCtrl = ($scope, SwimRecords) ->

    $scope.predicate =
      value: 'last_name'

    $scope.alerts = []

    $scope.addAlert = (swimRecord) ->
      $scope.alerts = []
      $scope.alerts.push
        type: "danger"
        msg: "#{swimRecord.swimmer.first_name}
              #{swimRecord.swimmer.last_name} has been checked out!"

    $scope.closeAlert = (index) ->
      $scope.alerts.splice index, 1

    $scope.deleteRow = (swimRecord) ->
      $scope.SwimRecords.splice $scope.SwimRecords.indexOf(swimRecord), 1

    $scope.checkOut = (swimRecord) ->
      $scope.addAlert(swimRecord)
      $scope.deleteRow(swimRecord)

    SwimRecords.index (data) ->
      $scope.SwimRecords = data
]


