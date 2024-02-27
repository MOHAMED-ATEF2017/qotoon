import 'package:flutter/material.dart';

import '../../Modules/LoginModules/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String loginScreenRouters = '/';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}
