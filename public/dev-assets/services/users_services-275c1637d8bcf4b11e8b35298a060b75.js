(function() {
  this.comsatrack.factory('Users', [
    '$resource', function($resource) {
      return $resource('/users.json', {}, {
        index: {
          method: 'GET',
          isArray: true
        }
      });
    }
  ]);

}).call(this);
