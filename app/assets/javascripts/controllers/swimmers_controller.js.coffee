@comsatrack.controller 'SwimmersCtrl', [
  '$location',
  '$scope',
  'Swimmers',
  '$modal'
  '$q'

  @SwimmersCtrl = ($location, $scope, Swimmers, $modal, $q) ->

    $scope.swimmers = Swimmers.index()

    swimmers = Swimmers.index()

    $scope.search = {}

    $scope.noPhone = (swimmer) ->
      swimmer.phone_added == false

    $scope.swimmerCheckedIn = (swimmer) ->
      swimmer.swimmer_checked_in is false

    $scope.totalDisplayed = 5

    $scope.loadMore = ->
      $scope.totalDisplayed += 5

    # $scope.checkIn = (swimmer) ->
    #   toastr.options.positionClass = 'toast-bottom-left'
    #   toastr.success 'Swimmer has been checked in.'
    #   $scope.search.last_name = ''

    $q.all {swimmers}
      .then (resources) =>
        angular.extend $scope, resources
        update()

    $scope.open = (swimmer, editMode) ->
      modalInstance = $modal.open
        templateUrl: 'add_phone.html',
        controller: PhoneModalCtrl,
        scope: $scope
        resolve:
          swimmer: -> swimmer

    PhoneModalCtrl = ($scope, $modalInstance, swimmer, Swimmers) ->
      angular.extend $scope,
        swimmer: swimmer

      $scope.update = ->
        updateExistingSwimmer(swimmer).then ->
          $modalInstance.close swimmer
          toastr.success 'Swimmer phone number was successfully updated.'

      updateExistingSwimmer = (swimmer) ->
        swimmerData = angular.extend swimmer,
          phone_number: $scope.swimmer.phone_number

        Swimmers.update id: swimmerData.id, swimmerData
        .$promise.then (updatedSwimmer) ->
          $scope.swimmers.push updatedSwimmer

      $scope.cancel = ->
        $modalInstance.dismiss 'Cancel'

      PhoneModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
        'swimmer'
        'Swimmers'
      ]
]
