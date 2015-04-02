@comsatrack.controller 'OutOfStateCtrl', [
  '$scope'
  '$http'
  'Swimmers'
  'OutOfState'
  '$location'

  @OutOfStateCtrl = ($scope, $http, Swimmers, OutOfState, $location) ->
    OutOfState.data()
    .$promise.then (outOfState) ->
      $scope.outOfState = outOfState

    Swimmers.index()
    .$promise.then (swimmers) ->
      $scope.swimmers = swimmers

      $scope.lastName = ''

      $scope.predicate =
        value: 'swimmer.first_name'

      $scope.totalDisplayed = 5
      $scope.loadMore = ->
        $scope.totalDisplayed += 5

      $scope.search = ->
        base_url = '/api/out_of_state?search='
        $http.get(base_url.concat($scope.lastName)).success (data) ->
          $scope.outOfState = data

        if $scope.outOfState.length
          $scope.noResults = true
        else
          $scope.noResults = false

      $scope.addSwimmer = (swimmer) ->
        Swimmers.create(swimmer).$promise.then (newSwimmer) ->
          $scope.outOfState = ''
          toastr.options.positionClass = 'toast-bottom-left'
          message = swimmer.first_name + ' ' + swimmer.last_name + ' has been added.'
          toastr.success message
]
