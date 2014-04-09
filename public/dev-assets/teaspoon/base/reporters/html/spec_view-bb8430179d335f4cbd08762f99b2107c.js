(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Teaspoon.Reporters.HTML.SpecView = (function(_super) {
    var viewId;

    __extends(SpecView, _super);

    viewId = 0;

    function SpecView(spec, reporter) {
      this.spec = spec;
      this.reporter = reporter;
      this.views = this.reporter.views;
      this.spec.viewId = viewId += 1;
      this.views.specs[this.spec.viewId] = this;
      SpecView.__super__.constructor.apply(this, arguments);
    }

    SpecView.prototype.build = function() {
      var classes;
      classes = ["spec"];
      if (this.spec.pending) {
        classes.push("state-pending");
      }
      SpecView.__super__.build.call(this, classes.join(" "));
      this.el.innerHTML = "<a href=\"" + this.spec.link + "\">" + (this.htmlSafe(this.spec.description)) + "</a>";
      this.parentView = this.buildParent();
      return this.parentView.append(this.el);
    };

    SpecView.prototype.buildParent = function() {
      var parent, view;
      parent = this.spec.parent;
      if (parent.viewId) {
        return this.views.suites[parent.viewId];
      } else {
        view = new Teaspoon.Reporters.HTML.SuiteView(parent, this.reporter);
        return this.views.suites[view.suite.viewId] = view;
      }
    };

    SpecView.prototype.buildErrors = function() {
      var div, error, html, _i, _len, _ref;
      div = this.createEl("div");
      html = "";
      _ref = this.spec.errors();
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        error = _ref[_i];
        html += "<strong>" + (this.htmlSafe(error.message)) + "</strong><br/>" + (this.htmlSafe(error.stack || "Stack trace unavailable"));
      }
      div.innerHTML = html;
      return this.append(div);
    };

    SpecView.prototype.updateState = function(state, elapsed) {
      var classes, result, _base;
      result = this.spec.result();
      classes = ["state-" + state];
      if (elapsed > Teaspoon.slow) {
        classes.push("slow");
      }
      if (state !== "failed") {
        this.el.innerHTML += "<span>" + elapsed + "ms</span>";
      }
      this.el.className = classes.join(" ");
      if (result.status !== "passed") {
        this.buildErrors();
      }
      return typeof (_base = this.parentView).updateState === "function" ? _base.updateState(state) : void 0;
    };

    return SpecView;

  })(Teaspoon.Reporters.BaseView);

}).call(this);
