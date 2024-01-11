import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_getx/controllers/todocontroller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('to do'),
      ),
      body: Container(
        child: Obx(
          () => ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(
                todoController.todos[index].text!,
                style: (todoController.todos[index].done)
                    ? const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      )
                    : const TextStyle(
                        color: Colors.black,
                      ),
              ),
              onTap: () {},
              trailing: Checkbox(
                value: todoController.todos[index].done,
                onChanged: (V) {
                  var changed = todoController.todos[index];
                  // changed.done = V;
                  todoController.todos[index] = changed;
                },
              ),
            ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: todoController.todos.length,
          ),
        ),
      ),
    );
  }
}
