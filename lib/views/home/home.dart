import 'package:flutter/material.dart';
import 'package:to_do_list/view_models/user_view_models.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Halooo ${user.username}'),
              ElevatedButton(
                  onPressed: () {
                    db.deleteData();
                  },
                  child: const Text('Delete')),
              ElevatedButton(onPressed: _show, child: const Text('Show')),
            ],
          ),
        ),
      );
    }
  }

  void _show() async {
    final id = await db.queryAllRows();
    debugPrint('query all rows:');
    for (final row in id) {
      debugPrint(row.toString());
    }
  }
}
