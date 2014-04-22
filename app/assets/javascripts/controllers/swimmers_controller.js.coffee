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

    $scope.inState = (swimmer) ->
      swimmer.in_state != false

    $scope.notOutOfState = (swimmer) ->
      swimmer.in_state == true
      swimmer.swimmer_checked_in is false

    $scope.noPhone = (swimmer) ->
      swimmer.phone_added == false

    $scope.swimmerCheckedIn = (swimmer) ->
      swimmer.swimmer_checked_in is false

    $scope.deleteRow = (swimmer) ->
      $scope.Swimmers.splice $scope.Swimmers.indexOf(swimmer), 1

    $scope.totalDisplayed = 10

    $scope.loadMore = ->
      $scope.totalDisplayed += 20

    Swimmers.index
      inState: !($location.$$absUrl.indexOf('in_state=false') != -1)
    ,
      (data) ->
        $scope.Swimmers = data
]
