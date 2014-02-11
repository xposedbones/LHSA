'use strict'

angular.module('testApp')
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
        name: "BANddK"
        img: "test"
        team: "Mapple Leaf de toronto"
        win: 10
        lost: 5
        shotPerGame: 20
      },
      {
        name: "BAdNK"
        img: "test"
        team: "Mapple Leaf de toronto"
        win: 10
        lost: 5
        shotPerGame: 20
      },
      {
        name: "BANK"
        img: "test"
        team: "Mapple Leaf de toronto"
        win: 10
        lost: 5
        shotPerGame: 20
      },
      {
        name: "BANK"
        img: "test"
        team: "Mapple Leaf de toronto"
        win: 10
        lost: 5
        shotPerGame: 20
      },
      {
        name: "BANK"
        img: "test"
        team: "Mapple Leaf de toronto"
        win: 10
        lost: 5
        shotPerGame: 20
      },
      {
        name: "BANK"
        img: "test"
        team: "Mapple Leaf de toronto"
        win: 10
        lost: 5
        shotPerGame: 20
      },
      {
        name: "BANK"
        img: "test"
        team: "Mapple Leaf de toronto"
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