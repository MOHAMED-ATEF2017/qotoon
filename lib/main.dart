import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qotoon/Shared/BlocInjections/container_injection.dart';
import 'package:qotoon/Shared/Components/text_style.dart';
import 'package:qotoon/Shared/Constants/app_colors.dart';
import 'package:qotoon/Shared/Router/router_configration.dart';

import 'Shared/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppSharedPreferences.initialSharedPreference();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  initKiwi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, _) {
          return MaterialApp.router(
            title: 'Qotoon',
            locale: const Locale('ar'),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: AppColors.ffE0BC66BorderColor,
                    primary: AppColors.ffE0BC66BorderColor),
                datePickerTheme: DatePickerThemeData(
                    headerBackgroundColor: AppColors.mainColorFF8D8083,
                    dayStyle: textStyle(size: 11),
                    headerHeadlineStyle:
                        textStyle(size: 11, color: Colors.white),
                    yearStyle: textStyle(size: 11),
                    confirmButtonStyle: ButtonStyle(
                        textStyle: MaterialStateProperty.all(textStyle())),
                    cancelButtonStyle: ButtonStyle(
                        textStyle: MaterialStateProperty.all(textStyle())),
                    rangePickerHeaderHeadlineStyle: textStyle(size: 11),
                    rangePickerHeaderHelpStyle: textStyle(size: 11),
                    headerHelpStyle: textStyle(size: 11, color: Colors.white),
                    weekdayStyle: textStyle(size: 11)),
                useMaterial3: true,
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white, centerTitle: true),
                scaffoldBackgroundColor: Colors.white),
            routerConfig: AppRoutersConfigration.router,
          );
        });
  }
}
