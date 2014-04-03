@comsatrack.controller 'SwimmersCtrl', ['$scope', 'Swimmers',
  @SwimmersCtrl = ($scope, Swimmers) ->

    $scope.predicate =
      value: 'last_name'

    $scope.showPhone = (swimmer) ->
      swimmer.phone_number?

    $scope.hideCheckin = (swimmer) ->
      swimmer.phone_number?

    Swimmers.index (data) ->
      $scope.Swimmers = data
]

