@comsatrack.controller 'UsersCtrl', [
  '$scope',
  'Users'

  @UsersCtrl = ($scope, Users) ->

    $scope.users = Users.index()

    $scope.predicate =
      value: 'last_name'

    $scope.updateAdmin = (user) ->
      if user.admin
        userData = angular.extend user,
          admin: false

        Users.update id: $scope.user.id, userData
        .$promise.then (updatedUser) ->
          $scope.users.push updatedUser
          toastr.success('Monitor administrative rights have been invoked')

      else
        userData = angular.extend user,
          admin: true

        Users.update id: $scope.user.id, userData
        .$promise.then (updatedUser) ->
          $scope.users.push updatedUser
          toastr.success('Monitor administrative rights have been granted')
]
