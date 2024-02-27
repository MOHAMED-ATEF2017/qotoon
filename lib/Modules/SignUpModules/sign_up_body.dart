import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qotoon/Screens/HomeScreen/home_screen.dart';

import '../../Shared/Components/container_button.dart';
import '../../Shared/Constants/app_strings.dart';
import '../../gen/assets.gen.dart';
import '../LoginModules/text_form_feild.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusNode().unfocus();
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(
          children: [
            Hero(
              tag: 'Logo',
              child: Center(
                child: Assets.images.logo.image(
                    alignment: Alignment.center,
                    width: 111.w,
                    height: 68.h,
                    fit: BoxFit.fill),
              ),
            ),
            16.verticalSpace,
            const AuthTextField(title: AppStrings.name),
            16.verticalSpace,
            const AuthTextField(title: AppStrings.phoneNo),
            16.verticalSpace,
            const AuthTextField(title: AppStrings.id),
            16.verticalSpace,
            const AuthTextField(title: AppStrings.birthday),
            130.verticalSpace,
            CustomContainerButton(
              title: AppStrings.signup,
              width: 1.sw,
              onPressed: () => context.go(HomeScreen.homeRoute),
            )
          ],
        ),
      ),
    );
  }
}
