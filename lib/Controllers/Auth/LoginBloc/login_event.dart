import 'package:flutter/material.dart';

import 'login_collect_data.dart';

class LoginEvent {}

class LoginEventStart extends LoginEvent {
  final LoginCollectData collectData;
  final BuildContext context;

  LoginEventStart({required this.context, required this.collectData});
}

class LoginCheckPhoneEventStart extends LoginEvent {
  final String phone;
  final BuildContext context;

  LoginCheckPhoneEventStart({required this.context, required this.phone});
}
