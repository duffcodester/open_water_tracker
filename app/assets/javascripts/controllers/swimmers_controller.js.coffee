@comsatrack.controller 'SwimmersCtrl', [
  '$location'
  '$scope'
  'Swimmers'
  'SwimRecords'
  '$modal'
  '$rootScope'
  '$http'
  'Application'

  @SwimmersCtrl = ($location, $scope, Swimmers, SwimRecords, $modal, $rootScope, $http, Application) ->
    $http.get('/api/swimmers.json').success (data) ->
      $scope.swimmers = data

    $http.get('/api/swim_records.json').success (data) ->
      $scope.swimRecords = data

    $scope.predicate =
      value: 'swimmer.last_name'

    $scope.filterSwimmersData = {}

    $scope.search = {}

    $scope.currentUser = Application.currentUser

    $scope.searchSwimmers =->
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
        $rootScope.$broadcast('decrementCheckOutCount')
        toastr.options.positionClass = 'toast-bottom-left'
        swimmer = swimRecord.swimmer.first_name + ' ' + swimRecord.swimmer.last_name
        toastr.success swimmer.concat(' has been checked out')

    $scope.checkIn = (swimmer) ->
      SwimRecords.create
        swimmer_id: swimmer.id
        account_id: Application.currentUser.account_id

      swimmerData =  angular.extend swimmer,
        phone_added: true
        swimmer_checked_in: true

      Swimmers.update id: swimmerData.id, swimmerData
      .$promise.then (updatedSwimmer) ->
        $scope.swimmers.splice $scope.swimmers.indexOf(swimmerData), 1
        $scope.swimmers.push updatedSwimmer
        $rootScope.$broadcast('incrementCheckOutCount')
        toastr.options.positionClass = 'toast-bottom-left'
        swimmer = swimmerData.first_name + ' ' + swimmerData.last_name
        toastr.success swimmer.concat(' has been checked in')
        $scope.search.last_name = ''

    $scope.openAddSwimmerModal = ->
      swimmer = {}

      modalInstance = $modal.open
        templateUrl: 'add_swimmer_modal.html'
        controller: ModalCtrl,
        scope: $scope,
        resolve:
          swimmer: -> swimmer

    $scope.openSetupModal = (swimmer) ->
      modalInstance = $modal.open
        templateUrl: 'setup_swimmer_modal.html',
        controller: ModalCtrl,
        scope: $scope
        resolve:
          swimmer: -> swimmer

    $scope.openViewSwimmerModal = (swimmer) ->
      modalInstance = $modal.open
        templateUrl: 'view_swimmer_modal.html',
        controller: ModalCtrl,
        scope: $scope
        resolve:
          swimmer: -> swimmer

    $scope.openEditSwimmerModal = (swimmer) ->
      modalInstance = $modal.open
        templateUrl: 'edit_swimmer_modal.html',
        controller: ModalCtrl,
        scope: $scope
        resolve:
          swimmer: -> swimmer

    $scope.deleteSwimmer = (swimmer) ->
      Swimmers.delete id: swimmer.id
      .$promise
      .then () ->
        toastr.success 'Swimmer deleted.'
        _.remove $scope.filterSwimmersData, id: swimmer.id
      .catch () ->
        toastr.error 'An error occurred.'

    ModalCtrl = ($scope, $modalInstance, swimmer, Swimmers) ->
      angular.extend $scope,
        swimmer: swimmer

      $scope.checkInSetupSwimmer = ->
        SwimRecords.create
          swimmer_id: swimmer.id
          account_id: Application.currentUser.account_id

        swimmerData = angular.extend swimmer,
          phone_added: true
          swimmer_checked_in: true
          phone_number: $scope.swimmer.phone_number

        Swimmers.update id: swimmerData.id, swimmerData
        .$promise.then (updatedSwimmer) ->
          $scope.swimmers.splice $scope.swimmers.indexOf(swimmerData), 1
          $scope.swimmers.push updatedSwimmer
          $rootScope.$broadcast('incrementCheckOutCount')
          toastr.options.positionClass = 'toast-bottom-left'
          toastr.success swimmerData.first_name + ' ' + swimmerData.last_name + ' has been checked in'
          $scope.search.last_name = ''
          $modalInstance.close swimmer

      $scope.updateSwimmer = ->
        swimmerData = angular.extend swimmer,
          phone_added: true
          swimmer_checked_in: true
          phone_number: $scope.swimmer.phone_number

        Swimmers.update id: swimmerData.id, swimmerData
        .$promise.then (updatedSwimmer) ->
          $scope.swimmers.splice $scope.swimmers.indexOf(swimmerData), 1
          $scope.swimmers.push updatedSwimmer
          toastr.options.positionClass = 'toast-bottom-left'
          toastr.success swimmerData.first_name + ' ' + swimmerData.last_name + ' has been updated'
          $modalInstance.close swimmer

      $scope.createSwimmer = ->
        swimmerData = angular.extend swimmer,
          phone_added: true
          swimmer_checked_in: false
          phone_number: $scope.swimmer.phone_number

        Swimmers.create swimmerData
        .$promise.then (createdSwimmer) ->
          $scope.swimmers.splice $scope.swimmers.indexOf(swimmerData), 1
          $scope.swimmers.push createdSwimmer
          toastr.options.positionClass = 'toast-bottom-left'
          toastr.success swimmerData.first_name + ' ' + swimmerData.last_name + ' has been created'
          $modalInstance.close swimmer

      $scope.cancel = ->
        $modalInstance.dismiss 'Cancel'

      ModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
        'swimmer'
        'Swimmers'
      ]
]
