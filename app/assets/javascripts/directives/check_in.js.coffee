@comsatrack.directive 'checkIn', ->
  restrict: 'E'
  templateUrl: '/check_in'
  scope:
    swimmer: '=info'

  link: (scope, element, attrs) ->
    scope.test = 'foo'
    element.bind 'click', ->
      console.log('click')
    scope.$apply()
      # newSwimRecord = new SwimRecord
      #   swimmer_id: scope.swimmer.id
      # newSwimRecord.$save()
