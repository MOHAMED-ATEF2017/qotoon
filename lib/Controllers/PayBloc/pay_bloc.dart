// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qotoon/Screens/LoginScreen/login_screen.dart';
import 'package:qotoon/Screens/PaymentMethodsScreen/pay_webview.dart';
import 'package:qotoon/Shared/logger.dart';

import '../../APIs/Server/api_header.dart';
import '../../APIs/Server/dio_helper.dart';
import '../../APIs/apis_urls.dart';
import '../../Shared/Components/toast.dart';
import '../../Shared/storage.dart';
import 'pay_event.dart';
import 'pay_state.dart';

class PayBloc extends Bloc<PayEvent, PayState> {
  PayBloc() : super(PayState()) {
    Response? response;
    on<PayEventStart>((event, emit) async {
      emit(PayStateStart());

      response = await DioHelper.postData(
        data: event.collectData.toJson(),
        ApisStrings.bookedUrl,
        headers: headersMapWithToken(),
      );
      logger.f(response!.statusCode);
      if (response!.statusCode == 200) {
        Navigator.of(event.context).push(MaterialPageRoute(
          builder: (context) => PaymentWebView(url: response!.data),
        ));
        emit(PayStateSuccess());
      } else if (response!.statusCode == 401) {
        AppSharedPreferences.prefs.clear();
        // AppSecureStorage.box.deleteAll();
        event.context.go(LoginScreen.loginScreenRouters);
        customToast(
          response!.data['message'].toString(),
          event.context,
        );
      } else {
        Navigator.of(event.context).push(MaterialPageRoute(
          builder: (context) => const PaymentWebView(
              url:
                  'https://demo.MyFatoorah.com/KWT/ie/01072347663542-9e4a84d9'),
        ));
        customToast(
          response!.data['message'] ?? '' + response!.data['error'] ?? '',
          event.context,
        );
        emit(PayStateFailed());
      }
    });
  }
}
