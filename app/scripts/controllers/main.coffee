'use strict'

angular.module('LHSA')
  .controller 'navigation', ($scope, $location) ->
    $scope.links = [
      {
        name: "Home"
        path: "/"
      },
      {
        name: "Classement"
        path: "/stats"
      }
    ]
    $scope.isActive = (route) ->
      route == $location.path()

  .controller 'MainCtrl', ($scope) ->
    $scope.teams = [
      {
        name: "Christiandré"
        img: "test"
        team: "Rangers de New York"
        win: 10
        lost: 5
        shotPerGame: 20
      },
      {
        name: "Brulvain"
        img: "test"
        team: "Ducks d'Anaheim"
        win: 10
        lost: 5
        shotPerGame: 20
      },
      {
        name: "Bank"
        img: "test"
        team: "Maple Leafs de Toronto"
        win: 10
        lost: 5
        shotPerGame: 20
      },
      {
        name: "Guillex"
        img: "test"
        team: "Islanders de New York"
        win: 10
        lost: 5
        shotPerGame: 20
      },
      {
        name: "Nicholis"
        img: "test"
        team: "Stars de Dallas"
        win: 10
        lost: 5
        shotPerGame: 20
      }
    ]
  .controller "detail", ($scope, $routeParams, $http) ->
    $http.get('details/' + $routeParams.teamName + '.json').success (data)->
      $scope.team = data
  .controller "stats", ($scope, $http) ->
    $http.get("details/all.json").success (data) ->
      $scope.data = data
      $scope.sortBy = '-stats.pts'