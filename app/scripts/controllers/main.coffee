'use strict'

angular.module('LHSA')
  .controller 'navigation', ($scope, $location, $http) ->
    $http.get("JSON/navigation.json").success (data) ->
      $scope.links = data
    $scope.isActive = (route) ->
      route == $location.path()

  .controller 'MainCtrl', ($scope, $http) ->
    $http.get("JSON/overview/overview.json").success (data) ->
      $scope.teams = data

  .controller "detail", ($scope, $routeParams, $http) ->
    $http.get('JSON/details/' + $routeParams.teamName + '.json').success (data)->
      $scope.team = data
      
  .controller "stats", ($scope, $http) ->
    $http.get("JSON/details/all.json").success (data) ->
      $scope.data = data
      $scope.sortBy = '-stats.pts'