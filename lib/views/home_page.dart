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
              } else if (snapshot.hasData == true) {
                return const Home(status: 'user');
              } else {
                return const Login();
              }
            }));
  }
}


// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late User user;
// // final String username;
// //   final User user;

// //   Future<void> getUserData() async {
// //     username = await db.getUser();
// //     user = User(username: username);
// //   }

// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     getUserData();
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder(
//             future: db.isDatabaseEmpty(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (snapshot.hasError) {
//                 return const Center(
//                   child: Text('Terjadi Kesalahan'),
//                 );
//               } else if (snapshot.hasData == true) {
//                 return Builder(builder: (context) {
//                   final String username = db.getUser();
//                 });
//               } else {
//                 return const Login();
//               }
//             }));
//   }
// }