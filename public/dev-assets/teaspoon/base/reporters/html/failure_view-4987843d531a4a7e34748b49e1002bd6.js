(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Teaspoon.Reporters.HTML.FailureView = (function(_super) {
    __extends(FailureView, _super);

    function FailureView(spec) {
      this.spec = spec;
      FailureView.__super__.constructor.apply(this, arguments);
    }

    FailureView.prototype.build = function() {
      var error, html, _i, _len, _ref;
      FailureView.__super__.build.call(this, "spec");
      html = "<h1 class=\"teaspoon-clearfix\"><a href=\"" + this.spec.link + "\">" + (this.htmlSafe(this.spec.fullDescription)) + "</a></h1>";
      _ref = this.spec.errors();
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        error = _ref[_i];
        html += "<div><strong>" + (this.htmlSafe(error.message)) + "</strong><br/>" + (this.htmlSafe(error.stack || "Stack trace unavailable")) + "</div>";
      }
      return this.el.innerHTML = html;
    };

    return FailureView;

  })(Teaspoon.Reporters.BaseView);

}).call(this);
