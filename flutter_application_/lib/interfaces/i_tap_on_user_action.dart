import 'package:flutter/material.dart';
import 'package:flutter_application_/models/user/user.dart';

abstract class ITapOnUserAction {
  void onTapUserAction(BuildContext context, User user);
}
