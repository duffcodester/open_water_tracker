@comsatrack.controller 'SwimmersCtrl', ['$location', '$scope', 'Swimmers',
  @SwimmersCtrl = ($location, $scope, Swimmers) ->

    $scope.predicate =
      value: 'last_name'

    $scope.hideButton =
      value: 'True'

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

    $scope.addedPhone = (swimmer) ->
      swimmer.phone_added?

    $scope.inState = (swimmer) ->
      swimmer.in_state == true

    $scope.deleteRow = (swimmer) ->
      $scope.Swimmers.splice $scope.Swimmers.indexOf(swimmer), 1

    $scope.hideCheckin = (swimmer) ->
      swimmer.phone_number?

    $scope.totalDisplayed = 10

    $scope.loadMore = ->
      $scope.totalDisplayed += 20

    Swimmers.index
      inState: !($location.$$absUrl.indexOf('in_state=false') != -1)
    ,
      (data) ->
        $scope.Swimmers = data
]
