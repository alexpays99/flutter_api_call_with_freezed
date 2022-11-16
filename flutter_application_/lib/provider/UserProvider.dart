import 'package:flutter/material.dart';
import '../models/user/user.dart';

class UserProvider extends ChangeNotifier {
  late User user;

  void setUser(User u) {
    user = u;
    notifyListeners();
  }
}
