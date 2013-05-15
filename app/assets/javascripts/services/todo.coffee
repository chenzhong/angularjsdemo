service = angular.module("appservices", ["ngResource"])
  
service.factory "Todo", ($resource) ->
  $resource "todos/:id/:action", {id: '@id'},
    update:
      method: "PUT"
