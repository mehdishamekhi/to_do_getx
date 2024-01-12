import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_getx/controllers/todocontroller.dart';
import 'package:to_do_getx/models/Todo.dart';

class TodoScreen extends StatelessWidget {
  final int? index;
  const TodoScreen({
    super.key,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find();
    String text =
        index != null ? todoController.todos[index!].text.toString() : '';

    TextEditingController textEditingController =
        TextEditingController(text: text);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: SizedBox(
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'What do you want to accomplish?',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 999,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        todoController.todos.add(
                          Todo(text: textEditingController.text),
                        );
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'add',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
