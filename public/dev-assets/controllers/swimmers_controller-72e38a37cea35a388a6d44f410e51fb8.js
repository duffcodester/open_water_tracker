(function() {
  this.comsatrack.controller('SwimmersCtrl', [
    '$scope', 'Swimmers', this.SwimmersCtrl = function($scope, Swimmers) {
      $scope.predicate = {
        value: 'last_name'
      };
      $scope.alerts = [];
      $scope.addAlert = function(swimmer) {
        $scope.alerts = [];
        return $scope.alerts.push({
          type: "success",
          msg: "" + swimmer.first_name + " " + swimmer.last_name + " has been checked in!"
        });
      };
      $scope.closeAlert = function(index) {
        return $scope.alerts.splice(index, 1);
      };
      $scope.showPhone = function(swimmer) {
        return swimmer.phone_number != null;
      };
      $scope.hideCheckin = function(swimmer) {
        return swimmer.phone_number != null;
      };
      $scope.totalDisplayed = 10;
      $scope.loadMore = function() {
        return $scope.totalDisplayed += 100;
      };
      return Swimmers.index(function(data) {
        return $scope.Swimmers = data;
      });
    }
  ]);

}).call(this);
