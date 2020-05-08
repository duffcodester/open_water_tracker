@comsatrack.controller 'SwimmersCtrl', [
  '$location'
  '$scope'
  'Swimmers'
  'SwimRecords'
  '$modal'
  '$rootScope'
  '$http'
  'Application'
  '$q'

  @SwimmersCtrl = ($location, $scope, Swimmers, SwimRecords, $modal, $rootScope, $http, Application, $q) ->
    $scope.loading = true

    $q.all
      swimmers: Swimmers.index().$promise
      swimRecords: SwimRecords.index().$promise
    .then (response) ->
      $scope.swimmers = response.swimmers
      $scope.swimRecords = response.swimRecords
      addViewDataToSwimmers()
      addViewDataToSwimRecords()
      $scope.loading = false
    .catch ->
      toastr.error "Error loading data. Please try again."

    addViewDataToSwimmers = ->
      console.log "adding view data to all swimmers"
      _.forEach $scope.swimmers, (swimmer) ->
        addViewDataToSwimmer(swimmer)

    addViewDataToSwimRecords = ->
      _.forEach $scope.swimRecords, (swimRecord) ->
        setSwimRecordState(swimRecord)

    addViewDataToSwimmer = (swimmer) ->
      checkedInSwimRecord = _.find $scope.swimRecords, swimmer_id: swimmer.id
      if checkedInSwimRecord
        swimmer.checked_in = true
      setSwimmerState(swimmer)

    setSwimmerState = (swimmer) ->
      if !swimmer.phone_number
        # needs set up with phone number
        swimmer.state = 0

      if swimmer.phone_number and not swimmer.checked_in
        # can check in
        swimmer.state = 1

      if swimmer.phone_number and not swimmer.checked_in and swimmer.loading
        # checking in, waiting for API response
        swimmer.state = 2

      if swimmer.phone_number and swimmer.checked_in and not swimmer.loading
        # checked in
        swimmer.state = 3

      if swimmer.phone_number and swimmer.checked_in and swimmer.loading
        #checking out
        swimmer.state = 4
      return swimmer

    setSwimRecordState = (swimRecord) ->
      if swimRecord
        # ready to check out
        swimRecord.state = 0
      if swimRecord and swimRecord.loading
        # checking out, waiting for API response
        swimRecord.state = 1
      return swimRecord

    $scope.predicate =
      value: 'swimmer.last_name'

    $scope.filterSwimmersData = {}

    $scope.search = {}

    $scope.currentUser = Application.currentUser

    resetSearch = ->
      console.log "resetting search..."
      $scope.search.last_name = ''

    $scope.searchSwimmers = ->
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
      swimmer = swimRecord.swimmer
      swimRecord.loading = true
      setSwimRecordState(swimRecord)

      SwimRecords.update id: swimRecord.id, 
        completed: true
        check_out: new Date()
        check_out_user_id: $scope.currentUser.id
        check_out_first_name: $scope.currentUser.first_name
        check_out_last_name: $scope.currentUser.last_name
      .$promise
      .then (completedSwimRecord) ->
        swimRecord.loading = false
        swimRecord.checked_in = false
        resetSearch()
        setSwimRecordState(swimRecord)

        #remove swimmer row
        $scope.swimRecords.splice $scope.swimRecords.indexOf(swimRecord), 1
        $rootScope.$broadcast('decrementCheckOutCount')
        toastr.options.positionClass = 'toast-bottom-left'
        swimmerFullName = swimmer.first_name + ' ' + swimmer.last_name
        toastr.success swimmerFullName.concat(' has been checked out')
      .catch ->
        swimRecord.loading = false
        toastr.error "An error occurred. Please try again."

    $scope.checkIn = (swimmer) ->
      swimmer.loading = true
      addViewDataToSwimmer(swimmer)
      SwimRecords.create
        swimmer_id: swimmer.id
        account_id: $scope.currentUser.account_id
        check_in_user_id: $scope.currentUser.id
        check_in_first_name: $scope.currentUser.first_name
        check_in_last_name: $scope.currentUser.last_name
        check_in: new Date()
      .$promise
      .then (createdSwimRecord) ->
        $scope.swimRecords.push createdSwimRecord
        swimmer.loading = false
        swimmer.checked_in = true
        addViewDataToSwimmer(swimmer)
        $rootScope.$broadcast('incrementCheckOutCount')
        toastr.options.positionClass = 'toast-bottom-left'
        swimmer = swimmer.first_name + ' ' + swimmer.last_name
        toastr.success swimmer.concat(' has been checked in')
        resetSearch()
      .catch ->
        swimmer.loading = false
        toastr.error "An error occurred. Please try again."

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
        _.remove $scope.swimmers, id: swimmer.id
      .catch () ->
        toastr.error 'An error occurred. Please try again.'

    ModalCtrl = ($scope, $modalInstance, swimmer, Swimmers) ->
      angular.extend $scope,
        swimmer: swimmer

      $scope.checkInSetupSwimmer = (swimmer) ->
        $scope.swimmer.loading = true
        addViewDataToSwimmer(swimmer)

        swimmerData = angular.extend swimmer,
          phone_number: $scope.swimmer.phone_number

        $q.all
          swimRecord: SwimRecords.create
            swimmer_id: $scope.swimmer.id
            account_id: Application.currentUser.account_id
          .$promise
          updatedSwimmer: Swimmers.update id: swimmerData.id, 
            swimmerData
          .$promise
        .then (updatedSwimmer) ->
          $scope.swimmer.loading = false
          $scope.swimmer.checked_in = true
          $scope.swimmers.splice $scope.swimmers.indexOf(swimmerData), 1
          $scope.swimmers.push addViewDataToSwimmer(swimmer)
          $rootScope.$broadcast('incrementCheckOutCount')
          toastr.options.positionClass = 'toast-bottom-left'
          toastr.success swimmerData.first_name + ' ' + swimmerData.last_name + ' has been checked in'
          resetSearch()
          $modalInstance.close swimmer
        .catch ->
          toastr.error "An error occurred. Please try again."

      $scope.updateSwimmer = ->
        swimmerData = angular.extend swimmer,
          phone_number: $scope.swimmer.phone_number
        Swimmers.update id: swimmerData.id, swimmerData
        .$promise
        .then (updatedSwimmer) ->
          $scope.swimmers.splice $scope.swimmers.indexOf(swimmerData), 1
          $scope.swimmers.push updatedSwimmer
          toastr.options.positionClass = 'toast-bottom-left'
          toastr.success swimmerData.first_name + ' ' + swimmerData.last_name + ' has been updated'
          $modalInstance.close swimmer
        .catch ->
          toastr.error "An error occurred. Please try again."

      $scope.createSwimmer = ->
        swimmerData = angular.extend swimmer,
          phone_number: $scope.swimmer.phone_number
        Swimmers.create swimmerData
        .$promise
        .then (createdSwimmer) ->
          $scope.swimmers.splice $scope.swimmers.indexOf(swimmerData), 1
          $scope.swimmers.push createdSwimmer
          toastr.options.positionClass = 'toast-bottom-left'
          toastr.success swimmerData.first_name + ' ' + swimmerData.last_name + ' has been created'
          $modalInstance.close swimmer
        .catch ->
          toastr.error "An error occurred. Please try again."

      $scope.cancel = ->
        $modalInstance.dismiss 'Cancel'

      ModalCtrl['$inject'] = [
        '$scope'
        '$modalInstance'
        'swimmer'
        'Swimmers'
      ]
]
