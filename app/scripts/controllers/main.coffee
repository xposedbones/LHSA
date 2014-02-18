'use strict'

angular.module('LHSA')
  .controller 'navigation', ($scope, $location, $http) ->
    $http.get("JSON/navigation.json").success (data) ->
      $scope.links = data
    $scope.isActive = (route) ->
      route == $location.path()

  .controller 'home', ($scope, $http) ->
    $http.get("JSON/overview/overview.json").success (data) ->
      $scope.teams = data
    $scope.$on('$viewContentLoaded', ->
      home()
    )

  .controller "detail", ($scope, $routeParams, $http) ->
    $http.get('JSON/details/' + $routeParams.teamName + '.json').success (data)->
      $scope.team = data
    $scope.$on('$viewContentLoaded', ->
      detail()
    )

  .controller "stats", ($scope, $http) ->
    $http.get("JSON/details/all.json").success (data) ->
      $scope.data = data
      $scope.sortBy = '-stats.pts'
    $scope.$on('$viewContentLoaded', ->
      stats()
    )


#
# FUNCTION
#
home = () ->
  console.log "Home is loaded"

detail = () ->
  console.log "Detail page is loaded"

stats = () ->
  console.log "stats page is loaded"
  $("th").click ->
    #get the index of the clicked element
    $(this).toggleClass("asc")
    $index = $(this).index()
    
    $("th, td").removeClass("active")
    $(this).addClass("active")
    $("tr").each ->
      $(this).find("td").eq($index).addClass("active")