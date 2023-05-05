import 'package:flutter/material.dart';
import 'package:to_do_list/views/my_theme.dart';

class ExitButton extends StatelessWidget {
  final void Function() onTap;
  const ExitButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.all(10),
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
            Icons.logout,
            size: 30,
          ))),
    );
  }
}
