'use strict'
angular.module('page.form', [ 'ngRoute']).config([
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider.when '/',
      templateUrl: '/templates/pages/page.html'
      controller: 'PageCtrl'
    return
]).controller 'PageCtrl', ['$scope', ($scope)->
  $scope.page=window.form_object
  $scope.options =
    language: 'de'
    allowedContent: true,
    entities: false
]
