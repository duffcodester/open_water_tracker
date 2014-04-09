(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Teaspoon.Reporters.Console = (function() {
    function Console() {
      this.reportRunnerResults = __bind(this.reportRunnerResults, this);
      this.start = new Teaspoon.Date();
      this.suites = {};
    }

    Console.prototype.reportRunnerStarting = function(runner) {
      return this.log({
        type: "runner",
        total: runner.total || (typeof runner.specs === "function" ? runner.specs().length : void 0) || 0,
        start: JSON.parse(JSON.stringify(this.start))
      });
    };

    Console.prototype.reportSuites = function() {
      var index, suite, _i, _len, _ref, _results;
      _ref = this.spec.getParents();
      _results = [];
      for (index = _i = 0, _len = _ref.length; _i < _len; index = ++_i) {
        suite = _ref[index];
        if (this.suites[suite.fullDescription]) {
          continue;
        }
        this.suites[suite.fullDescription] = true;
        _results.push(this.log({
          type: "suite",
          label: suite.description,
          level: index
        }));
      }
      return _results;
    };

    Console.prototype.reportSpecResults = function(spec) {
      var result;
      this.spec = new Teaspoon.Spec(spec);
      result = this.spec.result();
      if (result.skipped) {
        return;
      }
      this.reportSuites();
      switch (result.status) {
        case "pending":
          return this.trackPending();
        case "failed":
          return this.trackFailure();
        default:
          return this.log({
            type: "spec",
            suite: this.spec.suiteName,
            label: this.spec.description,
            status: result.status,
            skipped: result.skipped
          });
      }
    };

    Console.prototype.trackPending = function() {
      var result;
      result = this.spec.result();
      return this.log({
        type: "spec",
        suite: this.spec.suiteName,
        label: this.spec.description,
        status: result.status,
        skipped: result.skipped
      });
    };

    Console.prototype.trackFailure = function() {
      var error, result, _i, _len, _ref, _results;
      result = this.spec.result();
      _ref = this.spec.errors();
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        error = _ref[_i];
        _results.push(this.log({
          type: "spec",
          suite: this.spec.suiteName,
          label: this.spec.description,
          status: result.status,
          skipped: result.skipped,
          link: this.spec.fullDescription,
          message: error.message,
          trace: error.stack || error.message || "Stack Trace Unavailable"
        }));
      }
      return _results;
    };

    Console.prototype.reportRunnerResults = function() {
      this.log({
        type: "result",
        elapsed: ((new Teaspoon.Date().getTime() - this.start.getTime()) / 1000).toFixed(5),
        coverage: window.__coverage__
      });
      return Teaspoon.finished = true;
    };

    Console.prototype.log = function(obj) {
      if (obj == null) {
        obj = {};
      }
      obj["_teaspoon"] = true;
      return Teaspoon.log(JSON.stringify(obj));
    };

    return Console;

  })();

}).call(this);
