import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qotoon/Screens/HomeScreen/home_screen.dart';
import 'package:qotoon/Shared/Components/container_button.dart';
import 'package:qotoon/Shared/Components/text_style.dart';
import 'package:qotoon/Shared/Constants/app_colors.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';
import 'package:qotoon/gen/assets.gen.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});
  static const String paymentMethodsScreen = '/PaymentMethodsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Assets.images.logo.image(width: 68.w, height: 42.h),
          actions: [
            IconButton(
                onPressed: () {
                  context.go(Uri(
                      path: HomeScreen.homeRoute,
                      queryParameters: {'index': '4'}).toString());
                },
                icon: const Icon(Icons.arrow_forward))
          ]),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              24.verticalSpace,
              Center(child: Assets.icons.card.svg()),
              32.verticalSpace,
              const CustomTextFeild(
                hintText: AppStrings.cardName,
              ),
              16.verticalSpace,
              const CustomTextFeild(hintText: AppStrings.cardNo),
              16.verticalSpace,
              Row(
                children: [
                  const Expanded(
                      child: CustomTextFeild(hintText: AppStrings.cardEndYear)),
                  11.horizontalSpace,
                  const Expanded(
                      child:
                          CustomTextFeild(hintText: AppStrings.cardEndMonth)),
                ],
              ),
              16.verticalSpace,
              const CustomTextFeild(hintText: 'CVV'),
              81.verticalSpace,
              const CustomContainerButton(
                title: AppStrings.confirm,
                textColor: AppColors.ffE0BC66BorderColor,
              )
            ],
          )),
    );
  }
}

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hintText,
  });
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle(),
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
