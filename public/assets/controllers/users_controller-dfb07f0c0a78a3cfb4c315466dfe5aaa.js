(function(){this.comsatrack.controller("UsersCtrl",["$scope","Users",this.UsersCtrl=function($scope,Users){return $scope.predicate={value:"last_name"},Users.index(function(data){return $scope.Users=data})}])}).call(this);