@comsatrack.controller 'SwimmersCtrl', ['$location', '$scope', 'Swimmers',
  @SwimmersCtrl = ($location, $scope, Swimmers) ->

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

    $scope.noPhone = (swimmer) ->
      swimmer.phone_added == false

    $scope.swimmerCheckedIn = (swimmer) ->
      swimmer.swimmer_checked_in is false

    $scope.totalDisplayed = 10

    $scope.loadMore = ->
      $scope.totalDisplayed += 20

    $scope.checkIn = (swimmer) ->
      $scope.addAlert(swimmer)
      $scope.search.last_name = ''

    Swimmers.index (data) ->
      $scope.Swimmers = data
]
