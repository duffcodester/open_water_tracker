@comsatrack.controller 'OutOfStateCtrl', [
  '$scope'
  '$http'
  'Swimmers'

  @OutOfStateCtrl = ($scope, $http, Swimmers) ->
    $scope.swimmers = Swimmers.index()

    $scope.lastName = ''

    $scope.predicate =
      value: 'swimmer.first_name'

    $scope.totalDisplayed = 5
    $scope.loadMore = ->
      $scope.totalDisplayed += 5

    $scope.search = ->
      base_url = '/api/out_of_state?search='
      $http.get(base_url.concat($scope.lastName)).success (data) ->
        $scope.swimmers = data

    $scope.addSwimmer = (swimmer) ->
      Swimmers.create
        first_name: swimmer.first_name
        mi: swimmer.mi
        last_name: swimmer.last_name
        usms_number: swimmer.usms_number
        lmsc: swimmer.lmsc
        phone_number: swimmer.phone_number

      .$promise.then (newSwimmer) ->
        console.log 'Hi'
        $scope.search.swimmer.first_name = ''
        $scope.swimmers.splice $scope.swimmers.indexOf(newSwimmer), 1
        # $scope.swimmers.push newSwimmer
        toastr.options.positionClass = 'toast-bottom-left'
        swimmer = swimmer.first_name + ' ' + swimmer.last_name
        toastr.success(' has been added.')
]
