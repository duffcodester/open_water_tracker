@comsatrack.controller 'UsersCtrl', [
  '$scope'
  'Users'
  '$modal'

  @UsersCtrl = ($scope, Users, $modal) ->

    $scope.users = Users.index()

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
        if user.admin
          userData = angular.extend user,
            id: user.id
            admin: false

          Users.update id: user.id, userData
          $modalInstance.close swimmer
          .$promise.then (updatedUser) ->
            $scope.users.splice $scope.users.indexOf(userData), 1
            $scope.users.push updatedUser

            toastr.options.positionClass = 'toast-bottom-left'
            user = user.first_name + ' ' + user.last_name + "'s'"
            toastr.success user.concat(' administrative rights have been invoked.')



        else
          userData = angular.extend user,
            id: user.id
            admin: true

          Users.update id: user.id, userData
          $modalInstance.close swimmer
          .$promise.then (updatedUser) ->
            $scope.users.splice $scope.users.indexOf(userData), 1
            $scope.users.push updatedUser

            toastr.options.positionClass = 'toast-bottom-left'
            user = user.first_name + ' ' + user.last_name
            toastr.success user.concat(' has been granted administrative rights.')
        
      $scope.cancel = ->
        $modalInstance.dismiss 'Cancel'

      ModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
        'user'
        'Users'
      ]
]
