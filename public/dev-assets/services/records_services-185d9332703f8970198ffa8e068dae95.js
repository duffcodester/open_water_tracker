(function() {
  this.comsatrack.factory('Records', [
    '$resource', function($resource) {
      return $resource('/records.json', {}, {
        index: {
          method: 'GET',
          isArray: true
        }
      });
    }
  ]);

}).call(this);
