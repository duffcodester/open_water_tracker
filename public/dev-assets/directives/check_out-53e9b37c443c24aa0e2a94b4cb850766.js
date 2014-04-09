(function() {
  this.comsatrack.directive('checkOut', function() {
    return {
      restrict: 'E',
      templateUrl: '/check_out',
      scope: {
        swimRecord: '=info'
      },
      link: function(scope, element, attrs) {
        return element.bind('click', function() {
          scope.swimRecord.completed = true;
          return scope.swimRecord.$update(function(newSwimRecord, putResponseHeaders) {
            console.log('Great Success!');
            return console.log(newSwimRecord);
          });
        });
      }
    };
  });

}).call(this);
