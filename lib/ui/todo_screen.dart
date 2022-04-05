// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_sprint_test/controllers/todo_controller.dart';

class TodoScreen extends StatelessWidget {
  static const id = '/Todo_Screen';
  final TodoController todoController = Get.find<TodoController>();

  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController descriptionEditingController =
      TextEditingController();

  TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 40),
        child: Column(
          children: [
            Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: "What's your task?",
                  ),
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                  autofocus: true,
                  controller: textEditingController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Description",
                  ),
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                  controller: descriptionEditingController,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                RaisedButton(
                  child: const Text('Add'),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    if (textEditingController.text.isNotEmpty) {
                      todoController.addTodo(
                        text: textEditingController.text,
                        description: descriptionEditingController.text,
                      );
                      Get.back();
                    } else {
                      Get.snackbar('Error', 'Please enter a task',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          borderRadius: 10,
                          margin: EdgeInsets.all(10),
                          duration: Duration(seconds: 2));
                    }
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
