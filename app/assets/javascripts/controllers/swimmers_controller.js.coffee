@comsatrack.controller 'SwimmersCtrl', ['$location', '$scope', 'Swimmers',
  @SwimmersCtrl = ($location, $scope, Swimmers) ->

    $scope.search = {}

    $scope.noPhone = (swimmer) ->
      swimmer.phone_added == false

    $scope.swimmerCheckedIn = (swimmer) ->
      swimmer.swimmer_checked_in is false

    $scope.totalDisplayed = 10

    $scope.loadMore = ->
      $scope.totalDisplayed += 20

    $scope.checkIn = (swimmer) ->
      toastr.success 'Swimmer has been checked in.'
      $scope.search.last_name = ''

    Swimmers.index (data) ->
      $scope.Swimmers = data
]
