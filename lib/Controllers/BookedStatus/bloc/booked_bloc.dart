// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qotoon/Screens/LoginScreen/login_screen.dart';

import '../../../APIs/Server/api_header.dart';
import '../../../APIs/Server/dio_helper.dart';
import '../../../APIs/apis_urls.dart';
import '../../../Models/reversations_model.dart';
import '../../../Shared/Components/toast.dart';
import '../../../Shared/storage.dart';
import 'booked_event.dart';
import 'booked_state.dart';

class ReversationBloc extends Bloc<ReversationEvent, ReversationState> {
  ReversationBloc() : super(ReversationState()) {
    late ReversationsModel reversationsModel;
    Response? response;
    on<ReversationEventStart>((event, emit) async {
      emit(ReversationStateStart());
      response = await DioHelper.getData(
        "${ApisStrings.userBookedUrl}${event.status}",
        headers: headersMapWithToken(),
      );
      if (response!.statusCode == 200) {
        reversationsModel = ReversationsModel.fromJson(response!.data);
        emit(ReversationStateSuccess(reversationsModel: reversationsModel));
      } else if (response!.statusCode == 401) {
        AppSharedPreferences.prefs.clear();
        event.context.go(LoginScreen.loginScreenRouters);
      } else {
        // bookedModel = BookedModel.fromJson(response!.data);
        customToast(response!.statusMessage.toString(), event.context,
            isFromHome: true);
        emit(ReversationStateFailed());
      }
    });
  }
}
