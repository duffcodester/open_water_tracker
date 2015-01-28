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

    ModalCtrl = ($scope, $modalInstance, user, Users) ->
      angular.extend $scope,
        user: user

      $scope.updateAdmin = ->
        Users.update id: $scope.user.id, admin: !$scope.user.admin
        .$promise.then (updatedUser) ->
          $scope.user.admin = !$scope.user.admin
          message = $scope.user.first_name + ' ' + $scope.user.last_name + "'s" + ' administrative rights have been updated.'
          toastr.success message

      $scope.cancel = ->
        $modalInstance.dismiss 'Cancel'

      ModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
        'user'
        'Users'
      ]
]
