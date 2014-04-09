(function() {
  this.comsatrack.directive('checkIn', [
    'SwimRecords', function(SwimRecords) {
      return {
        restrict: 'E',
        templateUrl: '/check_in',
        scope: {
          swimmer: '=info'
        },
        link: function(scope, element, attrs) {
          return element.find('.btn').bind('click', function() {
            scope.swimmer.$update();
            return SwimRecords.create({
              swimmer_id: scope.swimmer.id
            });
          });
        }
      };
    }
  ]);

}).call(this);
