import 'package:flutter/material.dart';
import 'package:to_do_list/models/database_helper.dart';
import 'package:to_do_list/models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  late UserModel _user = UserModel(username: '');

  UserModel get user => _user;

  Future<void> loadUser(String status) async {
    final db = DatabaseHelper.instance;
    final user = await db.getUser(status);
    _user = user;
    notifyListeners();
  }
}
