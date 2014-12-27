@comsatrack.controller 'SwimmersCtrl', [
  '$location',
  '$scope',
  'Swimmers',
  'SwimRecords'
  '$modal'

  @SwimmersCtrl = ($location, $scope, Swimmers, SwimRecords, $modal) ->

    $scope.swimmers = Swimmers.index()
    SwimRecords.index (data) ->
      $scope.swimRecords = data

    $scope.predicate =
      value: 'swimmer.last_name'

    $scope.search = {}

    $scope.totalDisplayed = 5
    $scope.loadMore = ->
      $scope.totalDisplayed += 5

    $scope.deleteRow = (swimRecord) ->
      $scope.swimRecords.splice $scope.swimRecords.indexOf(swimRecord), 1

    $scope.checkOut = (swimRecord) ->
      toastr.options.positionClass = 'toast-bottom-left'
      toastr.success 'Swimmer has been checked out'
      $scope.deleteRow(swimRecord)

    $scope.checkIn = (swimmer) ->
      SwimRecords.create
        swimmer_id: swimmer.id

      swimmerData =  angular.extend swimmer,
        phone_added: true
        swimmer_checked_in: true

      Swimmers.update id: swimmerData.id, swimmerData
      .$promise.then (updatedSwimmer) ->
        $scope.search.last_name = ''
        $scope.swimmers.splice $scope.swimmers.indexOf(swimmerData), 1
        $scope.swimmers.push updatedSwimmer
        toastr.options.positionClass = 'toast-bottom-left'
        toastr.success 'Swimmer has been checked in'

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
          toastr.success 'Swimmer phone number updated'

      updateExistingSwimmer = (swimmer) ->
        swimmerData = angular.extend swimmer,
          phone_number: $scope.swimmer.phone_number

        Swimmers.update id: swimmerData.id, swimmerData
        .$promise.then (updatedSwimmer) ->
          $scope.swimmers.splice $scope.swimmers.indexOf(swimmerData), 1
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
