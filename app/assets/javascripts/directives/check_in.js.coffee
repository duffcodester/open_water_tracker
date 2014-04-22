@comsatrack.directive 'checkIn', ['SwimRecords',
  (SwimRecords) ->
    restrict: 'E'
    templateUrl: '/check_in'
    scope:
      swimmer: '=info'

    link: (scope, element, attrs) ->
      element.find('.btn').bind 'click', ->
        scope.swimmer.phone_added = true
        scope.swimmer.swimmer_checked_in = true
        scope.swimmer.$update()

        SwimRecords.create
          swimmer_id: scope.swimmer.id
]
