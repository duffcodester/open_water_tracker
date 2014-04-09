(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Teaspoon.Reporters.HTML = (function(_super) {
    __extends(HTML, _super);

    function HTML() {
      this.bindScenarioOutput = __bind(this.bindScenarioOutput, this);
      HTML.__super__.constructor.apply(this, arguments);
      angular.scenario.output("teaspoon", this.bindScenarioOutput);
    }

    HTML.prototype.bindScenarioOutput = function(context, runner, model) {
      model.on("specEnd", (function(_this) {
        return function(spec) {
          return _this.reportSpecResults(spec);
        };
      })(this));
      model.on("runnerEnd", (function(_this) {
        return function() {
          return _this.reportRunnerResults();
        };
      })(this));
      return model.on("runnerBegin", (function(_this) {
        return function() {
          var header, specs;
          _this.reportRunnerStarting({
            total: angular.scenario.Describe.specId
          });
          header = document.getElementById("header");
          if (header) {
            header.parentNode.removeChild(header);
          }
          specs = document.getElementById("specs");
          if (specs) {
            return specs.style.paddingTop = 0;
          }
        };
      })(this));
    };

    HTML.prototype.envInfo = function() {
      return "angular-scenario 1.0.5";
    };

    return HTML;

  })(Teaspoon.Reporters.HTML);

}).call(this);
