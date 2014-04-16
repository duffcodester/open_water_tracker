@comsatrack.controller 'SwimmersCtrl', ['$scope', 'Swimmers',
  @SwimmersCtrl = ($scope, Swimmers) ->

    $scope.predicate =
      value: 'last_name'

    $scope.alerts = []

    $scope.addAlert = (swimmer) ->
      $scope.alerts = []
      $scope.alerts.push
        type: "success"
        msg: "#{swimmer.first_name}
              #{swimmer.last_name} has been checked in!"

    $scope.closeAlert = (index) ->
      $scope.alerts.splice index, 1

    $scope.showPhone = (swimmer) ->
      swimmer.phone_number?

    $scope.hideCheckin = (swimmer) ->
      swimmer.phone_number?

    $scope.totalDisplayed = 10

    $scope.loadMore = ->
      $scope.totalDisplayed += 20

    Swimmers.index (data) ->
      $scope.Swimmers = data
]
