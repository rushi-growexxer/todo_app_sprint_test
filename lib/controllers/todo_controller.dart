import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_sprint_test/models/todo.dart';

class TodoController extends GetxController {
  var todos = List<Todo>.empty().obs;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todo');
    if (storedTodos != null) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos, (_) {
      GetStorage().write('todo', todos.toList());
    });
    super.onInit();
  }

  void addTodo(String text) {
    todos.add(Todo(text: text));
  }

  void removeTodo(int index) {
    todos.removeAt(index);
  }

  int get count => todos.length;
}
