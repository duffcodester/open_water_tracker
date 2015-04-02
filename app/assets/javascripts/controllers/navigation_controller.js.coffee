@comsatrack.controller 'NavigationCtrl', [
  '$scope'
  'SwimRecords'
  '$rootScope'

  @NavigationCtrl = ($scope, SwimRecords, $rootScope) ->
    $scope.checkOutCount = SwimRecords.index()

    $rootScope.$on 'countUp', ->
      $scope.checkOutCount.length += 1

    $rootScope.$on 'countDown', ->
      $scope.checkOutCount.length -= 1
]
