(function() {
  this.comsatrack.controller('SwimRecordsCtrl', [
    '$scope', 'SwimRecords', this.SwimRecordsCtrl = function($scope, SwimRecords) {
      $scope.predicate = {
        value: 'last_name'
      };
      $scope.alerts = [];
      $scope.addAlert = function(swimRecord) {
        $scope.alerts = [];
        return $scope.alerts.push({
          type: "danger",
          msg: "" + swimRecord.swimmer.first_name + " " + swimRecord.swimmer.last_name + " has been checked out!"
        });
      };
      $scope.closeAlert = function(index) {
        return $scope.alerts.splice(index, 1);
      };
      $scope.deleteRow = function(swimRecord) {
        return $scope.SwimRecords.splice($scope.SwimRecords.indexOf(swimRecord), 1);
      };
      return SwimRecords.index(function(data) {
        return $scope.SwimRecords = data;
      });
    }
  ]);

}).call(this);
