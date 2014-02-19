'use strict'

angular.module('LHSA', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngAnimate',
  'ngRoute'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/home.html'
        controller: 'home'
      .when '/stats',
        templateUrl: 'views/stats_all.html'
        controller: 'stats'
      .when '/equipe',
        templateUrl: 'views/equipe.html'
        controller: 'equipeCtrl'
      .when '/equipe/:teamName',
        templateUrl: "views/details.html"
        controller: 'detail'
      .when '/equipe/membre/:membreName',
        templateUrl: "views/detailMember.html"
        controller: "membreInfo"