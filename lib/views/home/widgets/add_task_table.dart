import 'package:flutter/material.dart';
import 'package:to_do_list/views/my_theme.dart';

class AddTaskTable extends StatelessWidget {
  final void Function() onTap;

  const AddTaskTable({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
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
          child: const Center(
              child: Icon(
            Icons.add,
            size: 50,
          ))),
    );
  }
}
