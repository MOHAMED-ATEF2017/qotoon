// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/Auth/ProfileBloc/get_user_bloc.dart';
import 'package:qotoon/Controllers/Auth/ProfileBloc/get_user_event.dart';
import 'package:qotoon/Models/login_model.dart';

import '../../../APIs/Server/api_header.dart';
import '../../../APIs/Server/dio_helper.dart';
import '../../../APIs/apis_urls.dart';
import '../../../Shared/Components/toast.dart';
import 'update_user_event.dart';
import 'update_user_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  UpdateProfileBloc() : super(UpdateProfileState()) {
    late Response response;
    final GetUserBloc getUserBloc = KiwiContainer().resolve<GetUserBloc>();
    //************** Update Profile ********************
    on<UpdateProfileEventStart>((event, emit) async {
      emit(UpdateProfileStateStart());
      response = await DioHelper.postData(
        ApisStrings.updateProfileUrl,
        data: event.collectData.toJson(),
        headers: headersMapWithToken(),
      );
      if (response.statusCode == 200) {
        // UpdateProfileEventStart(context: event.context);
        emit(UpdateProfileStateSuccess(
            loginData: LoginData.fromJson(response.data['data'])));
        customToast(
          response.data['message'].toString(),
          event.context,
        );
        getUserBloc.add(GetUserEventStart(context: event.context));
      } else {
        customToast(
          response.data['error'].toString(),
          event.context,
        );
        emit(UpdateProfileStateFailed());
      }
      // } else {
      //   customToast(
      //     response.data.toString(),
      //     event.context,
      //   );
      //   emit(UpdateProfileStateFailed());
      // }
    });
  }
}
