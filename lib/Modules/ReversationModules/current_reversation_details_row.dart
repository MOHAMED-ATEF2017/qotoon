import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Shared/Components/text_style.dart';
import '../../Shared/Constants/app_colors.dart';
import '../../gen/assets.gen.dart';

class CurrentReversationDetailsInfoRow extends StatelessWidget {
  const CurrentReversationDetailsInfoRow({
    super.key,
    required this.data,
    required this.svgGenImage,
  });
  final String data;
  final SvgGenImage svgGenImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        svgGenImage.svg(
            // ignore: deprecated_member_use_from_same_package
            color: AppColors.ffE0BC66BorderColor,
            width: 12.w,
            height: 14.h),
        8.horizontalSpace,
        Text(
          data,
          style: textStyle(size: 10, color: Colors.black),
        )
      ],
    );
  }
}
