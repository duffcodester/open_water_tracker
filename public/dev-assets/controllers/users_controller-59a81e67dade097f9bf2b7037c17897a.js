(function() {
  this.comsatrack.controller('UsersCtrl', [
    '$scope', 'Users', this.UsersCtrl = function($scope, Users) {
      $scope.predicate = {
        value: 'last_name'
      };
      return Users.index(function(data) {
        return $scope.Users = data;
      });
    }
  ]);

}).call(this);
