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
  width = 960
  height = 500
  radius = Math.min(width, height) / 2
  color = d3.scale.ordinal().range([
    "#98abc5"
    "#8a89a6"
    "#7b6888"
    "#6b486b"
    "#a05d56"
    "#d0743c"
    "#ff8c00"
  ])
  arc = d3.svg.arc().outerRadius(radius - 10).innerRadius(radius - 70)
  pie = d3.layout.pie().sort(null).value((d) ->
    d.population
  )
  svg = d3.select("#test").append("svg").attr("width", width).attr("height", height).append("g").attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
  d3.csv "/scripts/controllers/data.csv", (error, data) ->
    data.forEach (d) ->
      d.population = +d.population
      return

    g = svg.selectAll(".arc").data(pie(data)).enter().append("g").attr("class", "arc")
    g.append("path").attr("d", arc).style "fill", (d) ->
      color d.data.age

    g.append("text").attr("transform", (d) ->
      "translate(" + arc.centroid(d) + ")"
    ).attr("dy", ".35em").style("text-anchor", "middle").text (d) ->
      d.data.age
    console.log "Detail page is loaded"
    return


stats = () ->
  $("th").click ->
    #get the index of the clicked element
    $(this).toggleClass("asc")
    $index = $(this).index()
    
    $("th, td").removeClass("active")
    $(this).addClass("active")
    $("tr").each ->
      $(this).find("td").eq($index).addClass("active")