@comsatrack = angular.module 'comsatrack',
  ['ngResource',
   'comsatrackFilters',
   'googlechart',
   'ui.bootstrap',
   'ui.router']

.config ($httpProvider) ->
  authToken = $('meta[name="csrf-token"]').attr('content')
  $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = authToken

.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider.state 'index',
    url: '/'
    templateUrl: '/check_in.html'
    controller: 'SwimmersCtrl'

  .state 'checkIn',
    url: '/check_in'
    templateUrl: '/check_in.html'
    controller: 'SwimmersCtrl'
  .state 'checkOut',
    url: '/check_out'
    templateUrl: '/check_out.html'
    controller: 'SwimmersCtrl'
  .state 'outOfState',
    url: '/out_of_state'
    templateUrl: '/out_of_state.html'
    controller: 'OutOfStateCtrl'
  .state 'monitors',
    url: '/monitors'
    templateUrl: '/monitors.html'
    controller: 'UsersCtrl'
  .state 'monitorsNew',
    url: '/monitors/new'
    templateUrl: '/monitor_new.html'
    controller: 'UserCtrl'
  .state 'analytics',
    url: '/analytics'
    templateUrl: '/analytics.html'
    controller: 'AnalyticsCtrl'

  .state 'myProfile',
    url: '/my_profile'
    templateUrl: '/profile.html'
    controller: 'UserCtrl'
  .state 'myProfileEdit',
    url: '/my_profile/edit'
    templateUrl: '/my_profile_edit.html'
    controller: 'UserCtrl'

  .state 'faq',
    url: '/faq'
    templateUrl: '/public/faq.html'
  .state 'privacy',
    url: '/privacy'
    templateUrl: '/public/privacy.html'
  .state 'tos',
    url: '/tos'
    templateUrl: '/public/tos.html'

@comsatrackFilters = angular.module 'comsatrackFilters', []
