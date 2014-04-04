@comsatrack.directive 'checkIn', ['SwimRecords',
  (SwimRecords) ->
    restrict: 'E'
    templateUrl: '/check_in'
    scope:
      swimmer: '=info'

    link: (scope, element, attrs) ->
      element.find('.btn').bind 'click', ->
        scope.swimmer.$update()

        SwimRecords.create
          swimmer_id: scope.swimmer.id
]
