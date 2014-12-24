@comsatrack.controller 'SwimmersCtrl', [
  '$location',
  '$scope',
  'Swimmers',
  'SwimRecords'
  '$modal'
  '$q'

  @SwimmersCtrl = ($location, $scope, Swimmers, SwimRecords, $modal, $q) ->

    $scope.swimmers = Swimmers.index()

    $scope.search = {}

    $scope.totalDisplayed = 5
    $scope.loadMore = ->
      $scope.totalDisplayed += 5

    $scope.checkIn = (swimmer) ->
      toastr.options.positionClass = 'toast-bottom-left'
      toastr.success 'Swimmer has been checked in.'
      $scope.search.last_name = ''

      SwimRecords.create
        swimmer_id: swimmer.id

      swimmerData =
        id: swimmer.id
        phone_added: true
        swimmer_checked_in: true

      Swimmers.update id: swimmerData.id, swimmerData
      .$promise.then (updatedSwimmer) ->
        $scope.swimmers.push updatedSwimmer

    # $q.all {swimmers}
    #   .then (resources) =>
    #     angular.extend $scope, resources
    #     update()

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
