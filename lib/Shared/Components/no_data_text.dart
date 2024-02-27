import 'package:flutter/material.dart';

import '../Constants/app_colors.dart';
import '../Constants/app_strings.dart';
import 'text_style.dart';

class NoDataText extends StatelessWidget {
  const NoDataText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          AppStrings.noData,
          style: textStyle(
              size: 24,
              color: AppColors.ffE0BC66BorderColor,
              weight: FontWeight.bold),
              textAlign: TextAlign.center,
        ),
      );
  }
}
