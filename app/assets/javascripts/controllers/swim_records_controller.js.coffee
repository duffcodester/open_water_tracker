@comsatrack.controller 'SwimRecordsCtrl', ['$scope', 'SwimRecords',
  @SwimRecordsCtrl = ($scope, SwimRecords) ->

    $scope.predicate =
      value: 'swimmer.last_name'

    $scope.deleteRow = (swimRecord) ->
      $scope.SwimRecords.splice $scope.SwimRecords.indexOf(swimRecord), 1

    $scope.checkOut = (swimRecord) ->
      toastr.options.positionClass = "toast-bottom-left"
      toastr.success 'Swimmer has been checked out.'
      $scope.deleteRow(swimRecord)

    SwimRecords.index (data) ->
      $scope.SwimRecords = data
]
