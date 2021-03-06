@comsatrack.controller 'UserCtrl', [
  '$scope'
  'Application'
  'Users'
  '$window'
  '$rootScope'

  @UserCtrl = ($scope, Application, Users, $window, $rootScope) ->
    $scope.user = Application.currentUser
    $scope.currentUserAccount = Application.currentAccount
    $scope.users = Users.index()

    $scope.create = ->
      Users.create
        first_name: $scope.newUser.first_name
        last_name: $scope.newUser.last_name
        phone_number: $scope.newUser.phone_number
        email: $scope.newUser.email
        password: $scope.newUser.password
        password_confirmation: $scope.newUser.password_confirmation
        account_id: Application.currentUser.account_id

      .$promise.then (newMonitor) ->
        $scope.users.push newMonitor
        $window.location.assign('/monitors')

    $scope.update = ->
      userData =
        id: $scope.user.id
        first_name: $scope.user.first_name
        last_name: $scope.user.last_name
        phone_number: $scope.user.phone_number
        email: $scope.user.email
        password: $scope.user.password
        password_confirmation: $scope.user.password_confirmation
        account_id: Application.currentUser.account_id

      Users.update id: userData.id, userData
      .$promise.then (updateUser) ->
        $scope.users.push updateUser
        toastr.options.positionClass = 'toast-bottom-left'
        $window.location.assign('/my_profile')
]
