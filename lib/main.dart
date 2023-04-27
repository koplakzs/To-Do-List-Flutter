import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_list/models/database_helper.dart';
import 'package:to_do_list/views/login.dart';

final db = DatabaseHelper();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await db.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // initialRoute: "/",
      // routes: {
      //   '/': (context) => const Login(),
      // },
      home: Login(),
    );
  }
}
