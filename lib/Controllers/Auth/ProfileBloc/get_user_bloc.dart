// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qotoon/Models/login_model.dart';

import '../../../APIs/Server/api_header.dart';
import '../../../APIs/Server/dio_helper.dart';
import '../../../APIs/apis_urls.dart';
import '../../../Shared/Components/toast.dart';
import 'get_user_event.dart';
import 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserBloc() : super(GetUserState()) {
    late LoginData loginData;
    late Response response;
//***************** Get Profile ****************
    on<GetUserEventStart>((event, emit) async {
      emit(GetUserStateStart());
      response = await DioHelper.getData(
        ApisStrings.userProfileUrl,
        headers: headersMapWithToken(),
      );
      if (response.statusCode == 200) {
        if (response.data['error'] == null) {
          loginData = LoginData.fromJson(response.data['data']);

          emit(GetUserStateSuccess(loginData: loginData));
        } else {
          customToast(
            response.data['error'].toString(),
            event.context,
          );
          emit(GetUserStateFailed());
        }
      } else {
        customToast(
          response.data.toString(),
          event.context,
        );
        emit(GetUserStateFailed());
      }
    });
  }
}
