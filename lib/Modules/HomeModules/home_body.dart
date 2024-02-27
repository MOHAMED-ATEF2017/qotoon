import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/Home/HomeBloc/home_bloc.dart';
import 'package:qotoon/Controllers/Home/HomeBloc/home_event.dart';
import 'package:qotoon/Controllers/Home/HomeBloc/home_state.dart';
import 'package:qotoon/Modules/HomeModules/privacy_screen.dart';
import 'package:qotoon/Modules/HomeModules/terms_screen.dart';
import 'package:qotoon/Modules/HomeModules/who_are_we.dart';
import 'package:qotoon/Screens/SearchScreens/search_screen.dart';

import '../../Shared/Components/container_button.dart';
import '../../Shared/Components/text_style.dart';
import '../../Shared/Constants/app_colors.dart';
import '../../Shared/Constants/app_strings.dart';
import '../../gen/assets.gen.dart';
import 'home_discover_qotoon_listview.dart';
import 'home_discover_riadh_listview.dart';
import 'home_offer_stack.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          16.verticalSpace,
          // const HomeSearchContainer(),
          16.verticalSpace,
          Center(
            child: CustomContainerButton(
              title: AppStrings.search,
              width: 165.w,
              height: 28.h,
              textSize: 12,
              onPressed: () => context.go(SearchScreen.searchScreenRoute),
            ),
          ),
          27.verticalSpace,
          const HomeOfferStack(),
          32.verticalSpace,
          Text(
            '\t\t\t\tاكتشف الرياض',
            style:
                textStyle(weight: FontWeight.w700, color: AppColors.ff796870),
          ),
          30.verticalSpace,
          const HomeDiscoverRiadhListView(),
          32.verticalSpace,
          Text(
            '\t\t\t\tاكتشف قطون',
            style:
                textStyle(weight: FontWeight.w700, color: AppColors.ff796870),
          ),
          30.verticalSpace,
          const HomeDiscoverQotoonListView(),
          32.verticalSpace,
          InkWell(
            onTap: () => context.go(AboutUsScreen.aboutUsScreenRoute),
            child: Text(
              '\t\t\t\t* ${AppStrings.whoWeAre}  ',
              style: textStyle(color: AppColors.ff796870),
            ),
          ),
          InkWell(
            onTap: () => context.go(PrivacyScreen.privacyScreenRoute),
            child: Text(
              '\t\t\t\t* ${AppStrings.privacy}  ',
              style: textStyle(color: AppColors.ff796870),
            ),
          ),
          InkWell(
            onTap: () => context.go(TermsScreen.termsScreenRoute),
            child: Text(
              '\t\t\t\t* ${AppStrings.terms} ',
              style: textStyle(color: AppColors.ff796870),
            ),
          ),
          16.verticalSpace,
          const Divider(
            color: AppColors.ffE0BC66BorderColor,
          ),
          16.verticalSpace,
          Text(
            "\t\t\t\t${AppStrings.contactUs} ",
            style:
                textStyle(weight: FontWeight.w700, color: AppColors.ff796870),
          ),
          16.verticalSpace,
          const ContactUsSetting(),
        ]),
      ),
    );
  }
}

class ContactUsSetting extends StatelessWidget {
  const ContactUsSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = KiwiContainer().resolve<HomeBloc>();
    homeBloc.add(SettingEventStart(context: context));
    return BlocBuilder(
      bloc: homeBloc,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                23.horizontalSpace,
                Assets.icons.phone.svg(),
                8.horizontalSpace,
                Text(
                  state is SettingStateSuccess
                      ? state.settingModel.mobile
                      : "..............",
                  style: textStyle(size: 12, color: AppColors.ff796870),
                )
              ],
            ),
            20.verticalSpace,
            Row(
              children: [
                23.horizontalSpace,
                Assets.icons.email.svg(),
                8.horizontalSpace,
                Text(
                  state is SettingStateSuccess
                      ? state.settingModel.infoEmail
                      : "..............",
                  style: textStyle(size: 12, color: AppColors.ff796870),
                )
              ],
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                16.horizontalSpace,
                Assets.icons.tiktok.svg(),
                Assets.icons.insta.svg(),
                Assets.icons.whats.svg(),
                16.horizontalSpace,
              ],
            ),
            16.verticalSpace,
          ],
        );
      },
    );
  }
}
