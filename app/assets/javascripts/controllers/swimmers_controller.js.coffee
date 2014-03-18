@weowepro.controller 'SwimmersCtrl', ['$scope', 'Swimmers',
  @WeoweFormsCtrl = ($scope, Swimmers) ->

    $scope.predicate =
      value: 'last_name'

    Swimmers.index (data) ->
      $scope.Swimmers = data
]
