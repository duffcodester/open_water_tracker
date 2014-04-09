(function() {
  this.comsatrack = angular.module('comsatrack', ['ngResource', 'comsatrackFilters', 'ui.bootstrap', 'ngAnimate']).config(function($httpProvider) {
    var authToken;
    authToken = $('meta[name="csrf-token"]').attr('content');
    return $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = authToken;
  }).run(function(editableOptions, editableThemes) {
    editableThemes.bs3.inputClass = 'input-sx';
    editableThemes.bs3.buttonsClass = 'btn-sm';
    return editableOptions.theme = 'bs3';
  });

  this.comsatrackFilters = angular.module('comsatrackFilters', []);

}).call(this);
