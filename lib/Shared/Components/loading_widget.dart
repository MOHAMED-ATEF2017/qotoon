import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qotoon/gen/assets.gen.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.height = 56, this.width});
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return 
        SizedBox(
            width: (width??1.sw).w,
            height: (height??56).h,
            child: Assets.lotties.qotoon.lottie()
        )
     ;
  }
}
