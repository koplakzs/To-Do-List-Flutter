import 'package:flutter/material.dart';
import 'package:to_do_list/views/my_theme.dart';

class TaskTable extends StatelessWidget {
  final String name;
  final IconData icon;
  final void Function() onTap;
  const TaskTable(
      {Key? key, required this.name, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
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
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(
                height: 10,
              ),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}
