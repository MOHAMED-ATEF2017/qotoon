import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qotoon/Screens/InvestScreen/invest_screen.dart';
import 'package:qotoon/Screens/MyApartmentsScreen/my_apart_screen.dart';
import 'package:qotoon/Screens/PaymentMethodsScreen/payment_methods_screen.dart';
import 'package:qotoon/Screens/ProfileScreen/profile_screen.dart';
import 'package:qotoon/Shared/Components/text_style.dart';
import 'package:qotoon/Shared/Constants/app_colors.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  static const String settingScreenRoute = '/SettingScreen';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => context.go(ProfileScreen.profileScreenRouteName),
          child: SizedBox(
            height: 50.h,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "\t\t\t\t${AppStrings.myProfile}",
                style: textStyle(size: 15, color: AppColors.ff796870),
              ),
            ),
          ),
        ),
        const Divider(
          color: AppColors.ffE0BC66BorderColor,
        ),
        /* ExpansionTile(
          title: Text(
            AppStrings.setting,
            style: textStyle(size: 15, color: AppColors.ff796870),
          ),
          expandedAlignment: Alignment.centerRight,
          childrenPadding: EdgeInsets.symmetric(horizontal: 23.w),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          shape: const OutlineInputBorder(borderSide: BorderSide.none),
          children: [
            Text(
              AppStrings.language,
              style: textStyle(color: AppColors.ff9F9F9F, size: 15),
            ),
            Text(
              AppStrings.country,
              style: textStyle(color: AppColors.ff9F9F9F, size: 15),
            ),
          ],
        ),

        const Divider(
          color: AppColors.ffE0BC66BorderColor,
        ),*/
        InkWell(
          onTap: () {
            context.go(MyApartmentsScreen.myApartmentScreenRoute);
          },
          child: SizedBox(
            height: 50.h,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "\t\t\t\t${AppStrings.myApart}",
                style: textStyle(size: 15, color: AppColors.ff796870),
              ),
            ),
          ),
        ),
        const Divider(
          color: AppColors.ffE0BC66BorderColor,
        ),
        InkWell(
          onTap: () => context.go(PaymentMethodsScreen.paymentMethodsScreen),
          child: SizedBox(
            height: 50.h,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "\t\t\t\t${AppStrings.paymentMethods}",
                style: textStyle(size: 15, color: AppColors.ff796870),
              ),
            ),
          ),
        ),
        const Divider(
          color: AppColors.ffE0BC66BorderColor,
        ),
        InkWell(
          onTap: () => context.go(InvestWithUsScreen.investWithUsScreenRoute),
          child: SizedBox(
            height: 50.h,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "\t\t\t\t\$ ${AppStrings.investWithUs}",
                style: textStyle(
                    size: 15,
                    color: AppColors.ffE0BC66BorderColor,
                    weight: FontWeight.w700),
              ),
            ),
          ),
        ),
        const Divider(
          color: AppColors.ffE0BC66BorderColor,
        ),
      ],
    );
  }
}
