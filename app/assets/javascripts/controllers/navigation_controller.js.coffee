@comsatrack.controller 'NavigationCtrl', [
  '$scope'
  '$location'
  'SwimRecords'
  '$rootScope'

  @NavigationCtrl = ($scope, $location, SwimRecords, $rootScope) ->
    $scope.state = $location.path()

    $scope.checkOutCount = SwimRecords.index()

    $rootScope.$on "countUpdated", ->
      $scope.checkOutCount = SwimRecords.index()
]
