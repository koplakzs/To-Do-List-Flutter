import 'package:flutter/material.dart';
import 'package:to_do_list/views/home/widgets/add_task_table.dart';
import 'package:to_do_list/views/home/widgets/task_table.dart';
import 'package:to_do_list/views/my_theme.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: MyTheme.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 216, 216, 216),
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: Offset(0, 0))
            ]),
        child: Row(
          children: [
            Column(
              children: [
                TaskTable(name: 'Home', icon: Icons.home, onTap: () => {}),
                AddTaskTable(
                  onTap: () => {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
