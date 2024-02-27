import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qotoon/Screens/LoginScreen/login_screen.dart';

import '../../Modules/SignUpModules/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const String signUpRoute = '/SignUpScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(1.sw, .04.sh),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: IconButton(
              padding: EdgeInsets.only(top: 30.h),
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.go(LoginScreen.loginScreenRouters);
              },
            ),
          )),
      body: const SignupBody(),
    );
  }
}
