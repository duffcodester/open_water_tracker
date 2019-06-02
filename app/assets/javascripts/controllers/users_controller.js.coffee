@comsatrack.controller 'UsersCtrl', [
  '$scope'
  'Users'
  '$modal'
  'Application'

  @UsersCtrl = ($scope, Users, $modal, Application) ->
    $scope.users = Users.index()
    $scope.currentUser = Application.currentUser

    $scope.predicate =
      value: 'last_name'

    $scope.open = (user) ->
      modalInstance = $modal.open
        templateUrl: 'user.html',
        controller: ModalCtrl,
        scope: $scope
        resolve:
          user: -> user

    $scope.updateAdmin = (data) ->
      Users.update id: data.id, admin: !data.admin
      .$promise.then (updatedUser) ->
        data.admin = !data.admin
        message = data.first_name + ' ' + data.last_name + "'s" + ' administrative rights have been updated.'
        toastr.success message

    $scope.delete = (data) ->
      Users.delete id: data.id
      .$promise
      .then () ->
        message = 'Monitor has been deleted.'
        toastr.success message
        _.remove $scope.users, id: data.id
      .catch () ->
        toastr.error "An error occurred."
]
