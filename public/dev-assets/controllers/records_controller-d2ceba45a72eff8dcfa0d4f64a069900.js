(function() {
  this.comsatrack.controller('RecordsCtrl', [
    '$scope', 'Records', this.RecordsCtrl = function($scope, Records) {
      $scope.predicate = {
        value: 'check_in'
      };
      $scope.totalDisplayed = 20;
      $scope.loadMore = function() {
        return $scope.totalDisplayed += 100;
      };
      return Records.index(function(data) {
        return $scope.Records = data;
      });
    }
  ]);

}).call(this);
