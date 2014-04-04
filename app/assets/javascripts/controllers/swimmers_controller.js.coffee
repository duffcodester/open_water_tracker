@comsatrack.controller 'SwimmersCtrl', ['$scope', 'Swimmers',
  @SwimmersCtrl = ($scope, Swimmers) ->

    $scope.predicate =
      value: 'last_name'

    $scope.showPhone = (swimmer) ->
      swimmer.phone_number?

    $scope.hideCheckin = (swimmer) ->
      swimmer.phone_number?

    $scope.totalDisplayed = 20

    $scope.loadMore = ->
      $scope.totalDisplayed += 100

    Swimmers.index (data) ->
      $scope.Swimmers = data
]

