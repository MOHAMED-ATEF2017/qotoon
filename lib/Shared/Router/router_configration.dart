import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qotoon/Screens/MyApartmentsScreen/my_apart_screen.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';
import 'package:qotoon/Shared/storage.dart';

import '../../Modules/HomeModules/privacy_screen.dart';
import '../../Modules/HomeModules/terms_screen.dart';
import '../../Modules/HomeModules/who_are_we.dart';
import '../../Screens/HomeScreen/home_screen.dart';
import '../../Screens/InvestScreen/invest_screen.dart';
import '../../Screens/LoginScreen/login_screen.dart';
import '../../Screens/PaymentMethodsScreen/payment_methods_screen.dart';
import '../../Screens/ProfileScreen/profile_screen.dart';
import '../../Screens/SearchScreens/search_screen.dart';
import '../../Screens/SettingScreen/setting_screen.dart';
import '../../Screens/SignUpScreen/sign_up_screen.dart';

abstract class AppRoutersConfigration {
  static GoRouter router = GoRouter(
    initialLocation:
        AppSharedPreferences.getString(key: AppStrings.accessToken) == null
            ? LoginScreen.loginScreenRouters
            : HomeScreen.homeRoute,
    routes: <RouteBase>[
      GoRoute(
        path: LoginScreen.loginScreenRouters,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: SignUpScreen.signUpRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: HomeScreen.homeRoute,
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen(
              index: int.tryParse(state.uri.queryParameters['index'] ?? ''));
        },
      ),
      GoRoute(
        path: InvestWithUsScreen.investWithUsScreenRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const InvestWithUsScreen();
        },
      ),
      GoRoute(
        path: SettingScreen.settingScreenRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const SettingScreen();
        },
      ),
      GoRoute(
        path: PaymentMethodsScreen.paymentMethodsScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const PaymentMethodsScreen();
        },
      ),
      GoRoute(
        path: AboutUsScreen.aboutUsScreenRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const AboutUsScreen();
        },
      ),
      GoRoute(
        path: PrivacyScreen.privacyScreenRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const PrivacyScreen();
        },
      ),
      GoRoute(
        path: TermsScreen.termsScreenRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const TermsScreen();
        },
      ),
      GoRoute(
        path: SearchScreen.searchScreenRoute,
        builder: (BuildContext context, GoRouterState state) {
          return SearchScreen();
        },
      ),
      GoRoute(
        path: ProfileScreen.profileScreenRouteName,
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileScreen();
        },
      ),
      GoRoute(
        path: MyApartmentsScreen.myApartmentScreenRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const MyApartmentsScreen();
        },
      ),
      /* GoRoute(
        path: SearchResultsScreen.searchResultsScreenRoute,
        builder: (BuildContext context, GoRouteprofirState state) {
          return SearchResultsScreen(
            data: state.uri.queryParameters['data'] ?? '{}',
          );
        },
      ),
      GoRoute(
        path: ResultDetailsScreen.resultDetailsScreenRoute,
        builder: (BuildContext context, GoRouterState state) {
          return ResultDetailsScreen(
            searchDatum: state.uri.queryParameters['data'] ?? '{}',
            checkInDate: state.uri.queryParameters['in'] ?? '{}',
            checkOutDate: state.uri.queryParameters['out'] ?? '{}',
          );
        },
      ), */
    ],
  );
}
