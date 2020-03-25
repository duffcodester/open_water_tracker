@comsatrack.controller 'NavigationCtrl', [
  '$scope'
  'SwimRecords'
  '$rootScope'

  @NavigationCtrl = ($scope, SwimRecords, $rootScope) ->
    $scope.checkOutCount = SwimRecords.index()

    $rootScope.$on 'incrementCheckOutCount', ->
      $scope.checkOutCount.length += 1

    $rootScope.$on 'decrementCheckOutCount', ->
      $scope.checkOutCount.length -= 1
]
