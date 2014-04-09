(function() {
  this.comsatrack.controller('AlertsCtrl', [
    '$scope', this.AlertsCtrl = function($scope) {}, $scope.message = {
      type: "info",
      title: "Hey!",
      content: " Welcome back. This alert is for 5 seconds"
    }, $scope.successFn = function() {
      return $scope.message = {
        type: "success",
        title: "Success!",
        content: "This is success message"
      };
    }, $scope.warningFn = function() {
      return $scope.message = {
        type: "warning",
        title: "Warning!",
        content: "This is warning message"
      };
    }, $scope.errorFn = function() {
      return $scope.message = {
        type: "error",
        title: "Error!",
        content: "This is error message"
      };
    }
  ]);

}).call(this);
