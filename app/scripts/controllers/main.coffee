'use strict'

angular.module('LHSA')
  .controller 'navigation', ($scope, $location, $http) ->
    $http.get("JSON/navigation.json").success (data) ->
      $scope.links = data
    $scope.isActive = (route) ->
      route == $location.path()

  .controller 'teamCtrl', ($scope, $http) ->
    $http.get("JSON/overview/overview.json").success (data) ->
      $scope.teams = data
    $scope.$on('$viewContentLoaded', ->
      team()
    )

  .controller "detail", ($scope, $routeParams, $http) ->
    $http.get('JSON/details/' + $routeParams.teamName + '.json').success (data)->
      $scope.team = data
    $scope.$on('$viewContentLoaded', ->
      detail()
    )

  .controller "memberInfo", ($scope, $routeParams, $http) ->
    $http.get('JSON/details/membre/' + $routeParams.memberName + '.json').success (data)->
      $scope.membre = data
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

member = () ->


team = () ->
  console.log "team is loaded"

detail = (test) ->
  console.log "Detail page is loaded"


stats = () ->
  $("th").click ->
    #get the index of the clicked element
    $(this).toggleClass("asc")
    $index = $(this).index()
    
    $("th, td").removeClass("active")
    $(this).addClass("active")
    $("tr").each ->
      $(this).find("td").eq($index).addClass("active")