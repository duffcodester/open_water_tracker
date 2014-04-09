(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Teaspoon.Reporters.HTML = (function(_super) {
    __extends(HTML, _super);

    function HTML(env) {
      this.reportRunnerResults = __bind(this.reportRunnerResults, this);
      this.reportSpecResults = __bind(this.reportSpecResults, this);
      HTML.__super__.constructor.apply(this, arguments);
      env.log(this.reportSpecResults);
      env.testDone(this.reportSpecResults);
      env.done(this.reportRunnerResults);
      this.currentAssertions = [];
      this.reportRunnerStarting();
    }

    HTML.prototype.reportRunnerStarting = function() {
      this.total.exist = null;
      return this.setText("stats-duration", "...");
    };

    HTML.prototype.reportSpecResults = function(spec) {
      if (typeof spec.total !== "number") {
        this.currentAssertions.push(spec);
        return;
      }
      spec.assertions = this.currentAssertions;
      this.currentAssertions = [];
      this.reportSpecStarting(spec);
      return HTML.__super__.reportSpecResults.call(this, spec);
    };

    HTML.prototype.reportRunnerResults = function(result) {
      this.total.exist = this.total.run = result.total;
      return HTML.__super__.reportRunnerResults.apply(this, arguments);
    };

    HTML.prototype.readConfig = function() {
      HTML.__super__.readConfig.apply(this, arguments);
      return QUnit.config.notrycatch = this.config["use-catch"];
    };

    HTML.prototype.envInfo = function() {
      return "qunit 1.11.0";
    };

    return HTML;

  })(Teaspoon.Reporters.HTML);

  Teaspoon.Reporters.HTML.SpecView = (function(_super) {
    __extends(SpecView, _super);

    function SpecView() {
      return SpecView.__super__.constructor.apply(this, arguments);
    }

    SpecView.prototype.buildErrors = function() {
      var div, error, html, _i, _len, _ref;
      div = this.createEl("div");
      html = "";
      _ref = this.spec.errors();
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        error = _ref[_i];
        html += "<strong>" + error.message + "</strong><br/>" + (this.htmlSafe(error.stack || "Stack trace unavailable")) + "<br/>";
      }
      div.innerHTML = html;
      return this.append(div);
    };

    SpecView.prototype.buildParent = function() {
      var parent, view;
      parent = this.spec.parent;
      if (!parent) {
        return this.reporter;
      }
      if (this.views.suites[parent.description]) {
        return this.views.suites[parent.description];
      } else {
        view = new Teaspoon.Reporters.HTML.SuiteView(parent, this.reporter);
        return this.views.suites[parent.description] = view;
      }
    };

    return SpecView;

  })(Teaspoon.Reporters.HTML.SpecView);

  Teaspoon.Reporters.HTML.FailureView = (function(_super) {
    __extends(FailureView, _super);

    function FailureView() {
      return FailureView.__super__.constructor.apply(this, arguments);
    }

    FailureView.prototype.build = function() {
      var error, html, _i, _len, _ref;
      FailureView.__super__.build.call(this, "spec");
      html = "<h1 class=\"teaspoon-clearfix\"><a href=\"" + this.spec.link + "\">" + (this.htmlSafe(this.spec.fullDescription)) + "</a></h1>";
      _ref = this.spec.errors();
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        error = _ref[_i];
        html += "<div><strong>" + error.message + "</strong><br/>" + (this.htmlSafe(error.stack || "Stack trace unavailable")) + "</div>";
      }
      return this.el.innerHTML = html;
    };

    return FailureView;

  })(Teaspoon.Reporters.HTML.FailureView);

  Teaspoon.Reporters.HTML.SuiteView = (function(_super) {
    __extends(SuiteView, _super);

    function SuiteView(suite, reporter) {
      this.suite = suite;
      this.reporter = reporter;
      this.views = this.reporter.views;
      this.views.suites[this.suite.description] = this;
      this.build();
    }

    return SuiteView;

  })(Teaspoon.Reporters.HTML.SuiteView);

}).call(this);
