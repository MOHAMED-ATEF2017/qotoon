// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qotoon/APIs/Server/api_header.dart';
import 'package:qotoon/APIs/Server/dio_helper.dart';
import 'package:qotoon/APIs/apis_urls.dart';
import 'package:qotoon/Models/login_model.dart';
import 'package:qotoon/Screens/HomeScreen/home_screen.dart';
import 'package:qotoon/Shared/Components/toast.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';
import 'package:qotoon/Shared/storage.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static GlobalKey<FormState> formKey = GlobalKey();
  static TextEditingController otpController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();

  LoginBloc() : super(LoginState()) {
    late LoginModel loginModel;

    late Response response;

    //**********  Login ***************
    on<LoginEventStart>((event, emit) async {
      emit(LoginStateStart());
      response = await DioHelper.postData(ApisStrings.loginUrl,
          headers: headersMapWithoutToken(), data: event.collectData.toJson());
      if (response.statusCode == 200) {
        if (response.data['error'] == null) {
          loginModel = LoginModel.fromJson(response.data);
          Future.wait([
            AppSharedPreferences.setString(
                key: AppStrings.accessToken, value: loginModel.accessToken),
            AppSharedPreferences.setString(
                key: AppStrings.userData,
                value: jsonEncode(loginModel.data.toJson())),
          ]);

          event.context.go(HomeScreen.homeRoute);
          emit(LoginStateSuccess(loginModel: loginModel));
        } else {
          customToast(
            response.data['error'].toString(),
            event.context,
          );
          emit(LoginStateFailed());
        }
      } else {
        customToast(
          response.data.toString(),
          event.context,
        );
        emit(LoginStateFailed());
      }
    });

    //********** check phone ***************
    on<LoginCheckPhoneEventStart>((event, emit) async {
      emit(LoginCheckPhoneStateStart());
      response = await DioHelper.postData(ApisStrings.checkPhoneUrl,
          headers: headersMapWithoutToken(), data: {"phone": event.phone});
      if (response.statusCode == 200) {
        customToast(
          'تم ارسال الكود الي الرقم \n ${event.phone}',
          event.context,
        );
        emit(LoginCheckPhoneStateSuccess());
      } else {
        customToast(
          response.data.toString(),
          event.context,
        );
        emit(LoginStateFailed());
      }
    });
  }
}
