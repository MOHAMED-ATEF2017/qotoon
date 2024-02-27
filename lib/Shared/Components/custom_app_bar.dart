import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../Screens/HomeScreen/home_screen.dart';
import '../../gen/assets.gen.dart';

AppBar CustomAppBar(BuildContext context, int index) {
  return AppBar(
      title: Assets.images.logo.image(width: 68.w, height: 42.h),
      leading: 0.horizontalSpace,
      actions: [
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            context.go(Uri(
                path: HomeScreen.homeRoute,
                queryParameters: {'index': '$index'}).toString());
          },
        ),
      ]);
}
