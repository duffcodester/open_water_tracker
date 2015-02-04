@comsatrack.controller 'NavigationCtrl', [
  '$scope'
  '$location'
  'SwimRecords'
  '$rootScope'

  @NavigationCtrl = ($scope, $location, SwimRecords, $rootScope) ->
    $scope.state = $location.path()

    $scope.checkOutCount = SwimRecords.index()

    $rootScope.$on "countUp", ->
      $scope.checkOutCount.length += 1

    $rootScope.$on "countDown", ->
      $scope.checkOutCount.length -= 1
]
