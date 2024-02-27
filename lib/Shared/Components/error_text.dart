import 'package:flutter/material.dart';
import 'package:qotoon/Shared/Constants/app_colors.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';

import 'text_style.dart';

class ErrorCenterText extends StatelessWidget {
  const ErrorCenterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppStrings.errorData,
      style: textStyle(
        color: AppColors.ffE0BC66BorderColor,
        size: 24,
     weight: FontWeight.bold),
              textAlign: TextAlign.center,
      ),
    );
  }
}
