'use strict'
angular.module('page', ['ngRoute','page.form', 'ckeditor']).config [
  '$locationProvider'
  '$routeProvider'
  ($locationProvider, $routeProvider) ->
    $locationProvider.hashPrefix '!'
    $routeProvider.otherwise redirectTo: '/'
    return
]
