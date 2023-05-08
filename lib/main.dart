import 'package:flutter/material.dart';
import 'package:to_do_list/views/category_page.dart';
import 'package:to_do_list/views/home/home.dart';
import 'package:to_do_list/views/home_page.dart';
import 'package:to_do_list/views/login.dart';

void main() {
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
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => const HomePage(),
        '/category': (context) => const CategoryPage()
      },
    );
  }
}
