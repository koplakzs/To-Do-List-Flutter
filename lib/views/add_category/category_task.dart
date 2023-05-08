import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_list/views/my_theme.dart';

class CategoryTask extends StatelessWidget {
  const CategoryTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black12,
            backgroundColor: MyTheme.white,
            shadowColor: MyTheme.grey,
            elevation: 10, // Ketebalan bayangan
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () => {},
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          height: 70,
          child: Row(
            children: const [
              Icon(
                Icons.favorite,
                size: 30,
                color: Color.fromARGB(255, 52, 221, 5),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Home",
                style: TextStyle(
                    fontFamily: 'poppins', fontSize: 18, color: Colors.black),
              )
            ],
          ),
        ));
  }
}
