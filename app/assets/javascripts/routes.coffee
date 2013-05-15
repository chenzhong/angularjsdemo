angular.module "routes", [], ($routeProvider) ->
  $routeProvider
  .when "/todos",
    templateUrl: "assets/todos.html"
    controller: 'TodoCtrl'

  .when "/about",
    templateUrl: "assets/about.html"

  .otherwise redirectTo: "/todos"
