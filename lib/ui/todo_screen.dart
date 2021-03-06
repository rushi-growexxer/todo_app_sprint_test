import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_sprint_test/models/todo.dart';
import 'package:todo_app_sprint_test/controllers/todo_controller.dart';

class TodoScreen extends StatelessWidget {
  static const id = '/Todo_Screen';
  final TodoController todoController = Get.find<TodoController>();

  final TextEditingController textEditingController = TextEditingController();

  TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 40),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "What's your task?",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ignore: deprecated_member_use
                RaisedButton(
                  child: const Text('Cancel'),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    Get.back();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  child: const Text('Add'),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    todoController.addTodo(textEditingController.text);
                    Get.back();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
