@comsatrack.controller 'SwimmersCtrl', [
  '$location'
  '$scope'
  'Swimmers'
  'SwimRecords'
  '$modal'
  '$rootScope'
  '$http'

  @SwimmersCtrl = ($location, $scope, Swimmers, SwimRecords, $modal, $rootScope, $http) ->
    $http.get('/api/swimmers.json').success (data) ->
      $scope.swimmers = data

    $http.get('/api/swim_records.json').success (data) ->
      $scope.swimRecords = data

    $scope.predicate =
      value: 'swimmer.last_name'

    $scope.filterSwimmersData = {}

    $scope.search = {}

    $scope.findSwimmers =->
      filtered = []
      _.forEach $scope.swimmers, (swimmer) ->
        if swimmer.last_name.toLowerCase().indexOf($scope.search.last_name.toLowerCase()) >= 0
          filtered.push(swimmer)
      result = filtered

      if result.length is 0
        $scope.noResults = true
        $scope.filterSwimmersData = []
      else
        $scope.noResults = false
        $scope.filterSwimmersData = result

    $scope.checkOut = (swimRecord) ->
      swimmerData =  angular.extend swimRecord,
        completed: true
        swimmer_checked_in: false

      SwimRecords.update id: swimmerData.id, swimmerData
      .$promise.then (updatedSwimmer) ->
        $scope.search.last_name = ''
        $scope.swimRecords.splice $scope.swimRecords.indexOf(swimmerData), 1
        $scope.swimmers.push updatedSwimmer
        $rootScope.$broadcast('countDown')
        toastr.options.positionClass = 'toast-bottom-left'
        swimmer = swimRecord.swimmer.first_name + ' ' + swimRecord.swimmer.last_name
        toastr.success swimmer.concat(' has been checked out')

    $scope.checkIn = (swimmer) ->
      SwimRecords.create
        swimmer_id: swimmer.id

      swimmerData =  angular.extend swimmer,
        phone_added: true
        swimmer_checked_in: true

      Swimmers.update id: swimmerData.id, swimmerData
      .$promise.then (updatedSwimmer) ->
        $scope.swimmers.splice $scope.swimmers.indexOf(swimmerData), 1
        $scope.swimmers.push updatedSwimmer
        $rootScope.$broadcast('countUp')
        toastr.options.positionClass = 'toast-bottom-left'
        swimmer = swimmerData.first_name + ' ' + swimmerData.last_name
        toastr.success swimmer.concat(' has been checked in')
        $scope.search.last_name = ''

    $scope.open = (swimmer, editMode) ->
      modalInstance = $modal.open
        templateUrl: 'add_phone_modal.html',
        controller: ModalCtrl,
        scope: $scope
        resolve:
          swimmer: -> swimmer

    $scope.viewSwimmer = (swimmer) ->
      modalInstance = $modal.open
        templateUrl: 'swimmer.html',
        controller: ModalCtrl,
        scope: $scope
        resolve:
          swimmer: -> swimmer

    ModalCtrl = ($scope, $modalInstance, swimmer, Swimmers) ->
      angular.extend $scope,
        swimmer: swimmer

      $scope.update = ->
        updateExistingSwimmer(swimmer).then ->
          $modalInstance.close swimmer

      updateExistingSwimmer = (swimmer) ->
        SwimRecords.create
          swimmer_id: swimmer.id

        swimmerData =  angular.extend swimmer,
          phone_added: true
          swimmer_checked_in: true
          phone_number: $scope.swimmer.phone_number

        Swimmers.update id: swimmerData.id, swimmerData
        .$promise.then (updatedSwimmer) ->
          $scope.swimmers.splice $scope.swimmers.indexOf(swimmerData), 1
          $scope.swimmers.push updatedSwimmer
          $rootScope.$broadcast('countUp')
          toastr.options.positionClass = 'toast-bottom-left'
          swimmer = swimmerData.first_name + ' ' + swimmerData.last_name
          toastr.success swimmer.concat(' has been checked in')
          $scope.search.last_name = ''

      $scope.cancel = ->
        $modalInstance.dismiss 'Cancel'

      ModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
        'swimmer'
        'Swimmers'
      ]
]
