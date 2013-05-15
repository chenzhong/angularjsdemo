angular.module('app').controller 'TodoCtrl', ($scope, Todo) ->
  $scope.todos = Todo.query()

  $scope.addTodo = ->
    newTodo = new Todo
      text: $scope.todoText
      done: false

    newTodo.$save {}
    $scope.todos.push newTodo
    $scope.todoText = ""

  $scope.done = (todo) ->
    Todo.update({id: todo.id}, todo)

  $scope.remaining = ->
    count = 0
    angular.forEach $scope.todos, (todo) ->
      count += (if todo.done then 0 else 1)

    count

  $scope.archive = ->
    oldTodos = $scope.todos
    $scope.todos = []
    angular.forEach oldTodos, (todo) ->
      if !todo.done
        $scope.todos.push(todo)
      else
        Todo.delete({id: todo.id})
