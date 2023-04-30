import 'package:flutter/material.dart';
import 'package:to_do_list/models/database_helper.dart';
import 'package:to_do_list/views/home/home.dart';
import 'package:to_do_list/views/login.dart';

DatabaseHelper db = DatabaseHelper.instance;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: db.isDatabaseEmpty(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Terjadi Kesalahan'),
                );
              } else if (snapshot.data == true) {
                return const Login();
              } else {
                return const Home(status: 'user');
              }
            }));
  }
}
