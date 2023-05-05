import 'package:flutter/material.dart';
import 'package:to_do_list/view_models/user_view_models.dart';
import 'package:to_do_list/views/home/widgets/task.dart';
import 'package:to_do_list/views/home/widgets/title.dart';
import 'package:to_do_list/views/login.dart';
import 'package:to_do_list/views/my_theme.dart';

class Home extends StatefulWidget {
  final String status;
  const Home({Key? key, required this.status}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _userViewModel = UserViewModel();

  Future<void> _loadUser() async {
    await _userViewModel.loadUser(widget.status);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    if (_userViewModel.user.username.isEmpty) {
      return SizedBox(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      final user = _userViewModel.user;
      return Container(
          color: MyTheme.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Header(username: user.username), Task()],
          ));
    }
  }
}
