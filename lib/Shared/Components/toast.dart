import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qotoon/Shared/Components/text_style.dart';
import 'package:qotoon/gen/assets.gen.dart';

void customToast(String msg, BuildContext context , {bool isFromHome = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            width: 50.w,
            height: 50.h,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Assets.images.logo.image(),
          ),
          10.horizontalSpace,
          Expanded(
            child: Text(
              msg,
              style: textStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,

      backgroundColor: Colors.black.withOpacity(.25), // Adjust as desired
      duration: const Duration(seconds: 5), // Adjust duration as needed
      margin: EdgeInsets.only(bottom:(isFromHome? .75: .87).sh),
    ),
  );
}
