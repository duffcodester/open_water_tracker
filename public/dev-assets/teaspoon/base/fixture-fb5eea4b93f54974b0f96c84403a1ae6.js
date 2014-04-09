(function() {
  var __slice = [].slice;

  Teaspoon.fixture = (function() {
    var addContent, cleanup, create, load, loadComplete, preload, putContent, set, xhr, xhrRequest;

    fixture.cache = {};

    fixture.el = null;

    fixture.$el = null;

    fixture.json = [];

    fixture.preload = function() {
      var url, urls, _i, _len, _results;
      urls = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      _results = [];
      for (_i = 0, _len = urls.length; _i < _len; _i++) {
        url = urls[_i];
        _results.push(preload(url));
      }
      return _results;
    };

    fixture.load = function() {
      var append, index, url, urls, _i, _j, _len, _results;
      urls = 2 <= arguments.length ? __slice.call(arguments, 0, _i = arguments.length - 1) : (_i = 0, []), append = arguments[_i++];
      if (append == null) {
        append = false;
      }
      if (typeof append !== "boolean") {
        urls.push(append);
        append = false;
      }
      _results = [];
      for (index = _j = 0, _len = urls.length; _j < _len; index = ++_j) {
        url = urls[index];
        _results.push(load(url, append || index > 0));
      }
      return _results;
    };

    fixture.set = function() {
      var append, html, htmls, index, _i, _j, _len, _results;
      htmls = 2 <= arguments.length ? __slice.call(arguments, 0, _i = arguments.length - 1) : (_i = 0, []), append = arguments[_i++];
      if (append == null) {
        append = false;
      }
      if (typeof append !== "boolean") {
        htmls.push(append);
        append = false;
      }
      _results = [];
      for (index = _j = 0, _len = htmls.length; _j < _len; index = ++_j) {
        html = htmls[index];
        _results.push(set(html, append || index > 0));
      }
      return _results;
    };

    fixture.cleanup = function() {
      return cleanup();
    };

    function fixture() {
      Teaspoon.fixture.load.apply(window, arguments);
    }

    xhr = null;

    preload = function(url) {
      return load(url, false, true);
    };

    load = function(url, append, preload) {
      var cached, value;
      if (preload == null) {
        preload = false;
      }
      if (cached = Teaspoon.fixture.cache[url]) {
        return loadComplete(url, cached.type, cached.content, append, preload);
      }
      value = null;
      xhrRequest(url, function() {
        if (xhr.readyState !== 4) {
          return;
        }
        if (xhr.status !== 200) {
          throw "Unable to load fixture \"" + url + "\".";
        }
        return value = loadComplete(url, xhr.getResponseHeader("content-type"), xhr.responseText, append, preload);
      });
      return value;
    };

    loadComplete = function(url, type, content, append, preload) {
      Teaspoon.fixture.cache[url] = {
        type: type,
        content: content
      };
      if (type.match(/application\/json;/)) {
        return fixture.json[fixture.json.push(JSON.parse(content)) - 1];
      }
      if (preload) {
        return content;
      }
      if (append) {
        addContent(content);
      } else {
        putContent(content);
      }
      return Teaspoon.fixture.el;
    };

    set = function(content, append) {
      if (append) {
        return addContent(content);
      } else {
        return putContent(content);
      }
    };

    putContent = function(content) {
      cleanup();
      create();
      return Teaspoon.fixture.el.innerHTML = content;
    };

    addContent = function(content) {
      if (!Teaspoon.fixture.el) {
        create();
      }
      return Teaspoon.fixture.el.innerHTML += content;
    };

    create = function() {
      var _ref;
      Teaspoon.fixture.el = document.createElement("div");
      if (typeof window.$ === 'function') {
        Teaspoon.fixture.$el = $(Teaspoon.fixture.el);
      }
      Teaspoon.fixture.el.id = "teaspoon-fixtures";
      return (_ref = document.body) != null ? _ref.appendChild(Teaspoon.fixture.el) : void 0;
    };

    cleanup = function() {
      var _base, _ref, _ref1;
      (_base = Teaspoon.fixture).el || (_base.el = document.getElementById("teaspoon-fixtures"));
      if ((_ref = Teaspoon.fixture.el) != null) {
        if ((_ref1 = _ref.parentNode) != null) {
          _ref1.removeChild(Teaspoon.fixture.el);
        }
      }
      return Teaspoon.fixture.el = null;
    };

    xhrRequest = function(url, callback) {
      var e;
      if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
      } else if (window.ActiveXObject) {
        try {
          xhr = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (_error) {
          e = _error;
          try {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
          } catch (_error) {
            e = _error;
          }
        }
      }
      if (!xhr) {
        throw "Unable to make Ajax Request";
      }
      xhr.onreadystatechange = callback;
      xhr.open("GET", "" + Teaspoon.root + "/fixtures/" + url, false);
      return xhr.send();
    };

    return fixture;

  })();

}).call(this);
