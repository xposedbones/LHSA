'use strict'

angular.module('testApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/stats',
        templateUrl: 'views/stats.html'
        controller: 'MainCtrl'
      .when '/detailed',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/detailed/:teamName',
        templateUrl: "views/details.html"
        controller: 'detail'