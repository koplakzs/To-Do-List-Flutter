import 'package:flutter/material.dart';
import 'package:to_do_list/models/database_helper.dart';
import 'package:to_do_list/views/home/widgets/exit._button.dart';
import 'package:to_do_list/views/login.dart';
import 'package:to_do_list/views/my_theme.dart';

DatabaseHelper db = DatabaseHelper.instance;

class Header extends StatelessWidget {
  final String? username;
  const Header({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 10, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi! $username',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const Text('To Do List Aplication',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              const Text('0 Task belum selesai !',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                  ))
            ],
          ),
          ExitButton(onTap: () {
            _delete();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const Login()),
                (route) => false);
          })
        ],
      ),
    );
  }

  void _delete() async {
    await db.deleteData();
  }
}
