import 'package:flutter/material.dart';
import 'package:to_do_list/models/database_helper.dart';
import 'package:to_do_list/views/my_theme.dart';

final db = DatabaseHelper();

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
                        _insert(data);
                      },
                      child: const Text('Login')),
                  ElevatedButton(onPressed: _query, child: const Text('Show'))
                ],
              ),
            ),
          )),
    );
  }

  void _insert(String username) async {
    Map<String, dynamic> row = {'username': username};

    final id = await db.insertUser(row);
    debugPrint('inserted row id : $id');
  }

  void _query() async {
    final allRows = await db.queryAllRows();
    debugPrint('query all rows:');
    for (final row in allRows) {
      debugPrint(row.toString());
    }
  }
}
