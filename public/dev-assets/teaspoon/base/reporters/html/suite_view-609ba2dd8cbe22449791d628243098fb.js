(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Teaspoon.Reporters.HTML.SuiteView = (function(_super) {
    var viewId;

    __extends(SuiteView, _super);

    viewId = 0;

    function SuiteView(suite, reporter) {
      this.suite = suite;
      this.reporter = reporter;
      this.views = this.reporter.views;
      this.suite.viewId = viewId += 1;
      this.views.suites[this.suite.viewId] = this;
      this.suite = new Teaspoon.Suite(suite);
      SuiteView.__super__.constructor.apply(this, arguments);
    }

    SuiteView.prototype.build = function() {
      SuiteView.__super__.build.call(this, "suite");
      this.el.innerHTML = "<h1><a href=\"" + this.suite.link + "\">" + (this.htmlSafe(this.suite.description)) + "</a></h1>";
      this.parentView = this.buildParent();
      return this.parentView.append(this.el);
    };

    SuiteView.prototype.buildParent = function() {
      var parent, view;
      parent = this.suite.parent;
      if (!parent) {
        return this.reporter;
      }
      if (parent.viewId) {
        return this.views.suites[parent.viewId];
      } else {
        view = new Teaspoon.Reporters.HTML.SuiteView(parent, this.reporter);
        return this.views.suites[view.suite.viewId] = view;
      }
    };

    SuiteView.prototype.append = function(el) {
      if (!this.ol) {
        SuiteView.__super__.append.call(this, this.ol = this.createEl("ol"));
      }
      return this.ol.appendChild(el);
    };

    SuiteView.prototype.updateState = function(state) {
      var _base;
      if (this.state === "failed") {
        return;
      }
      this.el.className = "" + (this.el.className.replace(/\s?state-\w+/, "")) + " state-" + state;
      if (typeof (_base = this.parentView).updateState === "function") {
        _base.updateState(state);
      }
      return this.state = state;
    };

    return SuiteView;

  })(Teaspoon.Reporters.BaseView);

}).call(this);
