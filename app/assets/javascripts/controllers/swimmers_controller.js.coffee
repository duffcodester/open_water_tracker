@comsatrack.controller 'SwimmersCtrl', [
  '$scope',
  '$http',
  'Swimmers',
  @SwimmersCtrl = ($scope, $http, Swimmers) ->

    $scope.predicate =
      value: 'last_name'

    $scope.showPhone = (swimmer) ->
      true  if swimmer.phone_number isnt null

    $scope.hideCheckin = (swimmer) ->
      true  if swimmer.phone_number isnt null

    Swimmers.index (data) ->
      $scope.Swimmers = data
]

