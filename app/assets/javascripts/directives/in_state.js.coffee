@comsatrack.directive 'inState', ['SwimRecords',
  (SwimRecords) ->
    restrict: 'E'
    templateUrl: '/in_state'
    scope:
      swimmer: '=info'

    link: (scope, element, attrs) ->
      element.find('.btn').bind 'click', ->
        scope.swimmer.in_state = true
        scope.swimmer.$update()
]
