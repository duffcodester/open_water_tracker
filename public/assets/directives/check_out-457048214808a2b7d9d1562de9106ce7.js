(function(){this.comsatrack.directive("checkOut",function(){return{restrict:"E",templateUrl:"/check_out",scope:{swimRecord:"=info"},link:function(scope,element){return element.bind("click",function(){return scope.swimRecord.completed=!0,scope.swimRecord.$update(function(newSwimRecord){return console.log("Great Success!"),console.log(newSwimRecord)})})}}})}).call(this);