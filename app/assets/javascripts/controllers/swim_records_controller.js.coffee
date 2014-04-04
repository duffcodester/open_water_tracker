@comsatrack.controller 'SwimRecordsCtrl', ['$scope', 'SwimRecords', '$timeout',
  @SwimRecordsCtrl = ($scope, SwimRecords, $timeout) ->

    $scope.predicate =
      value: 'check_in'

    $scope.alerts = []

    $scope.addAlert = (swimRecord) ->
      $scope.alerts = []
      $scope.alerts.push
        type: "danger"
        msg: "#{swimRecord.swimmer.first_name}
              #{swimRecord.swimmer.last_name} has been checked out!"
      $timeout (->
            console.log "Removing alert: " + alert
            $scope.alerts.splice $scope.alerts.indexOf(alert), 1
          ), 4000

    $scope.closeAlert = (index) ->
      $scope.alerts.splice index, 1

    $scope.deleteRow = (swimRecord) ->
      $scope.SwimRecords.splice $scope.SwimRecords.indexOf(swimRecord), 1

    SwimRecords.index (data) ->
      $scope.SwimRecords = data
]


