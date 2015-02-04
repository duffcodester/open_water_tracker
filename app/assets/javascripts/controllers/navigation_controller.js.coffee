@comsatrack.controller 'NavigationCtrl', [
  '$scope'
  '$location'
  'SwimRecords'
  '$rootScope'

  @NavigationCtrl = ($scope, $location, SwimRecords, $rootScope) ->
    $scope.state = $location.path()

    $scope.checkOutCount = SwimRecords.index().length

    $rootScope.$on "countUp", ->
      $scope.checkOutCount = $scope.checkOutCount + 1

    $rootScope.$on "countDown", ->
      $scope.checkOutCount = $scope.checkOutCount - 1
]
