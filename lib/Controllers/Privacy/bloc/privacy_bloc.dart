// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qotoon/Models/about_us_model.dart';

import '../../../APIs/Server/api_header.dart';
import '../../../APIs/Server/dio_helper.dart';
import '../../../APIs/apis_urls.dart';
import '../../../Shared/Components/toast.dart';
import 'privacy_event.dart';
import 'privacy_state.dart';

class PrivacyBloc extends Bloc<PrivacyEvent, PrivacyState> {
  PrivacyBloc() : super(PrivacyState()) {
    late AboutUsModel privacyModel;
    Response? response;
    on<PrivacyEventStart>((event, emit) async {
      emit(PrivacyStateStart());
      response = await DioHelper.getData(
        ApisStrings.privacyUrl,
        headers: headersMapWithoutToken(),
      );
      if (response!.statusCode == 200) {
        privacyModel = AboutUsModel.fromJson(response!.data);
        emit(PrivacyStateSuccess(privacyModel: privacyModel));
      } else {
        privacyModel = AboutUsModel.fromJson(response!.data);
        customToast(
          response!.statusMessage.toString(),
          event.context,
        );
        emit(PrivacyStateFailed());
      }
    });
  }
}
