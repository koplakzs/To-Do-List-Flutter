import 'package:flutter/material.dart';
import 'package:to_do_list/models/database_helper.dart';
import 'package:to_do_list/views/home/widgets/add_task_view.dart';
import 'package:to_do_list/views/home/widgets/task_view.dart';
import 'package:to_do_list/views/my_theme.dart';

DatabaseHelper db = DatabaseHelper.instance;

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int? result;

  Future<void> getData() async {
    int? count = await db.countTables();
    setState(() {
      result = count;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
        child: GridView.builder(
          itemCount: result != null ? result! - 1 : 0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) {
            if (index >= result! - 2) {
              return AddTaskTable(
                  onTap: () => {Navigator.pushNamed(context, '/category')});
            } else {
              return TaskView(name: 'home', icon: Icons.home, onTap: () => {});
            }
          },
        ),
      ),
    );
  }
}
