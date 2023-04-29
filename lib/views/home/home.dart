import 'package:flutter/material.dart';
import 'package:to_do_list/models/database_helper.dart';
import 'package:to_do_list/models/user_model.dart';
import 'package:to_do_list/views-models/user_view_models.dart';
import 'package:to_do_list/views/login.dart';

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
      return Container(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      final user = _userViewModel.user;
      return Container(
        child: Center(
          child: Text('Halooo ${user.username}'),
        ),
      );
    }
  }
}
