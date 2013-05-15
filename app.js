angular.module('appservices', ['ngResource']).
    factory('Todo', function($resource) {
        return $resource('app.php?action=:action', {action: 'get'}, {
            save: {method: 'POST', params: {action: 'save'}},
            delete: {method: 'DELETE', params: {action: 'delete'}},
            done: {method: 'POST', params: {action: 'done'}}
        });
});

angular.module('routes', [], function($routeProvider) {
    $routeProvider
        .when('/todos', {templateUrl: 'todos.html', controller: TodoCtrl})
        .when('/about', {templateUrl: 'about.html'})
        .otherwise({redirectTo: '/todos'});
});

angular.module('app', ['appservices', 'routes']);

function TodoCtrl($scope, Todo, $resource) {
    $scope.todos = Todo.query();

    $scope.remaining = function () {
        var count = 0;
        angular.forEach($scope.todos, function(todo) {
            count += todo.done ? 0 : 1;
        });

        return count;
    };

    $scope.archive = function () {
        var oldTodos = $scope.todos;
        $scope.todos = [];
        angular.forEach(oldTodos, function(todo) {
            if (!todo.done) {
                $scope.todos.push(todo);
            } else {
                Todo.delete({}, todo);
            }
        });
    };

    $scope.done = function(todo) {
        Todo.done({}, todo);
    };

    $scope.addTodo = function() {
        var newTodo = new Todo({text:$scope.todoText, done:false});

        newTodo.$save({});

        $scope.todos.push(newTodo);

        $scope.todoText = '';
    };
}
