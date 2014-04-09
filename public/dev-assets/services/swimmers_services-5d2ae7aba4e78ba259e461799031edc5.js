(function() {
  this.comsatrack.factory('Swimmers', [
    '$resource', function($resource) {
      return $resource('/swimmers/:id.json', {
        id: '@id'
      }, {
        index: {
          method: 'GET',
          isArray: true
        },
        update: {
          method: 'PUT'
        },
        create: {
          method: 'POST'
        }
      });
    }
  ]);

}).call(this);
