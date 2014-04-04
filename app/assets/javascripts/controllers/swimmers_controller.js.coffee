@comsatrack.controller 'SwimmersCtrl', ['$scope', 'Swimmers', '$timeout',
  @SwimmersCtrl = ($scope, Swimmers, $timeout) ->

    $scope.predicate =
      value: 'last_name'

    $scope.alerts = []

    $scope.addAlert = (swimmer) ->
      $scope.alerts = []
      $scope.alerts.push
        type: "success"
        msg: "#{swimmer.first_name}
              #{swimmer.last_name} has been checked in!"
      $timeout (->
            console.log "Removing alert: " + alert
            $scope.alerts.splice $scope.alerts.indexOf(alert), 1
          ), 4000

    $scope.closeAlert = (index) ->
      $scope.alerts.splice index, 1

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

