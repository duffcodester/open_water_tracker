@comsatrack.controller 'RecordsCtrl', ['$scope', 'Records',
  @RecordsCtrl = ($scope, Records) ->

    $scope.predicate =
      value: 'check_in'

    $scope.totalDisplayed = 20

    $scope.loadMore = ->
      $scope.totalDisplayed += 20

    Records.index (data) ->
      $scope.Records = data
]
