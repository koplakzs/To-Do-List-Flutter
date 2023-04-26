import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/views/my_theme.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textUsername = TextEditingController();

    return Scaffold(
      body: Container(
          color: MyTheme.grey,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(30),
              height: 300,
              width: 300,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Input Your Name',
                    style: TextStyle(
                      fontSize: 35,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextField(
                    controller: textUsername,
                    decoration:
                        const InputDecoration(hintText: 'Enter Username'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        String data = textUsername.text;
                        print(data);
                      },
                      child: const Text('Login'))
                ],
              ),
            ),
          )),
    );
  }
}
