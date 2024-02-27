import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/Home/HomeCubit/home_cubit.dart';
import 'package:qotoon/Shared/Components/text_style.dart';
import 'package:qotoon/Shared/Constants/app_colors.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';
import 'package:qotoon/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.index});
  static const String homeRoute = '/HomeScreen';
  final int? index;
  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = KiwiContainer().resolve<HomeCubit>();
    if (index != null) {
      homeCubit.changeIndex(index!);
    }
    return BlocBuilder(
      bloc: homeCubit,
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Hero(
                  tag: 'Logo',
                  child: Assets.images.logo.image(width: 68.w, height: 42.h)),
              leading: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.list)),
              actions: [
                const Icon(
                  Icons.notifications_active,
                  color: AppColors.ff796870,
                ),
                10.horizontalSpace,
              ],
            ),
            body: homeCubit.homeBodies[homeCubit.initialIndex],
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 24.h,
                          child: Assets.icons.home.svg(
                              colorFilter: ColorFilter.mode(
                                  AppColors.ffE0BC66BorderColor,
                                  homeCubit.initialIndex == 0
                                      ? BlendMode.srcATop
                                      : BlendMode.dst)),
                        ),
                        Text(
                          AppStrings.main,
                          style: textStyle(
                              size: 10,
                              color: homeCubit.initialIndex == 0
                                  ? AppColors.ffE0BC66BorderColor
                                  : AppColors.mainColorFF8D8083),
                        )
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 24.h,
                          child: Assets.icons.favorite.svg(
                              colorFilter: ColorFilter.mode(
                                  AppColors.ffE0BC66BorderColor,
                                  homeCubit.initialIndex == 1
                                      ? BlendMode.srcATop
                                      : BlendMode.dst)),
                        ),
                        Text(
                          AppStrings.favorite,
                          style: textStyle(
                              size: 10,
                              color: homeCubit.initialIndex == 1
                                  ? AppColors.ffE0BC66BorderColor
                                  : AppColors.mainColorFF8D8083),
                        )
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 24.h,
                          child: Assets.icons.briefcase.svg(
                              colorFilter: ColorFilter.mode(
                                  AppColors.ffE0BC66BorderColor,
                                  homeCubit.initialIndex == 2
                                      ? BlendMode.srcATop
                                      : BlendMode.dst)),
                        ),
                        Text(
                          AppStrings.myReservation,
                          style: textStyle(
                              size: 10,
                              color: homeCubit.initialIndex == 2
                                  ? AppColors.ffE0BC66BorderColor
                                  : AppColors.mainColorFF8D8083),
                        )
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 24.h,
                          child: Assets.icons.chat.svg(
                              colorFilter: ColorFilter.mode(
                                  AppColors.ffE0BC66BorderColor,
                                  homeCubit.initialIndex == 3
                                      ? BlendMode.srcATop
                                      : BlendMode.dst)),
                        ),
                        Text(
                          AppStrings.chat,
                          style: textStyle(
                              size: 10,
                              color: homeCubit.initialIndex == 3
                                  ? AppColors.ffE0BC66BorderColor
                                  : AppColors.mainColorFF8D8083),
                        )
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 24.h,
                          child: Assets.icons.person.svg(
                              colorFilter: ColorFilter.mode(
                                  AppColors.ffE0BC66BorderColor,
                                  homeCubit.initialIndex == 4
                                      ? BlendMode.srcATop
                                      : BlendMode.dst)),
                        ),
                        Text(
                          AppStrings.person,
                          style: textStyle(
                              size: 10,
                              color: homeCubit.initialIndex == 4
                                  ? AppColors.ffE0BC66BorderColor
                                  : AppColors.mainColorFF8D8083),
                        )
                      ],
                    ),
                    label: ''),
              ],
              currentIndex: homeCubit.initialIndex,
              onTap: (value) {
                homeCubit.changeIndex(value);
              },
            ));
      },
    );
  }
}
