@comsatrack.controller 'UsersCtrl', ['$scope', 'Users',
  @UsersCtrl = ($scope, Users) ->

    $scope.predicate =
      value: 'last_name'

    Users.index (data) ->
      $scope.Users = data
]
