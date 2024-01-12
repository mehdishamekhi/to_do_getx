import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_getx/controllers/todocontroller.dart';
import 'package:to_do_getx/screens/todoscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('to do'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const TodoScreen());
        },
        child: const Icon(Icons.add),
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
              onTap: () {
                Get.to(
                  TodoScreen(index: index),
                );
              },
              leading: Checkbox(
                value: todoController.todos[index].done,
                onChanged: (v) {
                  var changed = todoController.todos[index];
                  changed.done = v!;
                  todoController.todos[index] = changed;
                },
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: todoController.todos.length,
          ),
        ),
      ),
    );
  }
}
