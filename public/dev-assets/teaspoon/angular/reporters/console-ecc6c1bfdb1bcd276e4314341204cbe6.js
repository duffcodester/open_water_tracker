(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Teaspoon.Reporters.Console = (function(_super) {
    __extends(Console, _super);

    function Console() {
      this.bindScenarioOutput = __bind(this.bindScenarioOutput, this);
      Console.__super__.constructor.apply(this, arguments);
      angular.scenario.output("teaspoon", this.bindScenarioOutput);
    }

    Console.prototype.bindScenarioOutput = function(context, runner, model) {
      model.on("runnerBegin", (function(_this) {
        return function() {
          return _this.reportRunnerStarting({
            total: angular.scenario.Describe.specId
          });
        };
      })(this));
      model.on("specEnd", (function(_this) {
        return function(spec) {
          return _this.reportSpecResults(spec);
        };
      })(this));
      return model.on("runnerEnd", (function(_this) {
        return function() {
          return _this.reportRunnerResults();
        };
      })(this));
    };

    return Console;

  })(Teaspoon.Reporters.Console);

}).call(this);
