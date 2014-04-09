(function() {
  this.comsatrack.factory('SwimRecords', [
    '$resource', function($resource) {
      return $resource('/swim_records/:id.json', {
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
