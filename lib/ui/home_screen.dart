// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_sprint_test/main.dart';
import 'package:todo_app_sprint_test/controllers/todo_controller.dart';
import 'package:todo_app_sprint_test/ui/edit_todo.dart';
import 'package:todo_app_sprint_test/ui/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/Home_screen';
  final TodoController todoController = Get.put(TodoController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Todo App - ${todoController.count} Task(s) Left'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Get.toNamed(TodoScreen.id);
          },
        ),
        body:
            // check for zero items in todo list

            todoController.todos.length < 1
                ? Center(
                    child: Text(
                      'No Todos',
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        color: Colors.purple,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (_) {
                        todoController.todos.removeAt(index);
                        Get.snackbar('Remove!', "Task was succesfully Delete",
                            snackPosition: SnackPosition.BOTTOM);
                      },
                      child: ListTile(
                        title: Text(todoController.todos[index].text,
                            style: TextStyle(
                                color: todoController.todos[index].done
                                    ? Colors.purple
                                    : Colors.black,
                                decoration: todoController.todos[index].done
                                    ? TextDecoration.lineThrough
                                    : null,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        subtitle: todoController.todos[index].description !=
                                null
                            ? Text(
                                todoController.todos[index].description ?? '',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14.0,
                                  decoration: todoController.todos[index].done
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              )
                            : null,

                        trailing: IconButton(
                          onPressed: () => Get.to(() => TodoEdit(index: index)),
                          icon: const Icon(Icons.edit),
                        ),
                        leading: Checkbox(
                          value: todoController.todos[index].done,
                          onChanged: (newvalue) {
                            var todo = todoController.todos[index];
                            todo.done = newvalue!;
                            todoController.todos[index] = todo;
                          },
                        ),
                        // delete the Todo on long press
                        onLongPress: () {
                          todoController.removeTodo(index);
                          Get.snackbar(
                              'Removed!', "Task was Deleted succesfully.",
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Colors.white,
                              backgroundColor: Colors.purple,
                              duration: Duration(seconds: 1));
                        },
                      ),
                    ),
                    itemCount: todoController.todos.length,
                  ),
      ),
    );
  }
}
