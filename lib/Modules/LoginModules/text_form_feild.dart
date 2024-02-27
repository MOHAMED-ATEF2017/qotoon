import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';

import '../../Shared/Components/text_style.dart';
import '../../Shared/Constants/app_colors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key,
      required this.title,
      this.onSaved,
      this.validator,
      this.controller,
      this.type,
      this.initialValue});
  final String title;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? initialValue;
  final TextFormFeildTypes? type;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: validator != null ? 120.h : 95.h,
      width: 328.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle(size: 16, color: Colors.black.withOpacity(.26)),
          ),
          const Spacer(),
          TextFormField(
            initialValue: initialValue,
            style: textStyle(),
            keyboardType: type == TextFormFeildTypes.numbers
                ? TextInputType.number
                : type == TextFormFeildTypes.phone
                    ? TextInputType.phone
                    : null,
            onSaved: onSaved,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
                errorStyle: textStyle(size: 10, color: Colors.red),
                filled: true,
                fillColor:
                    AppColors.textFeildFillColor0x1E959595.withOpacity(.12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(
                        color: AppColors.ffE0BC66BorderColor))),
          )
        ],
      ),
    );
  }
}
