// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qotoon/Models/about_us_model.dart';

import '../../../APIs/Server/api_header.dart';
import '../../../APIs/Server/dio_helper.dart';
import '../../../APIs/apis_urls.dart';
import '../../../Shared/Components/toast.dart';
import 'terms_event.dart';
import 'terms_state.dart';

class TermsBloc extends Bloc<TermsEvent, TermsState> {
  TermsBloc() : super(TermsState()) {
    late AboutUsModel termsModel;
    Response? response;
    on<TermsEventStart>((event, emit) async {
      emit(TermsStateStart());
      response = await DioHelper.getData(
        ApisStrings.termsUrl,
        headers: headersMapWithoutToken(),
      );
      if (response!.statusCode == 200) {
        termsModel = AboutUsModel.fromJson(response!.data);
        emit(TermsStateSuccess(termsModel: termsModel));
      } else {
        termsModel = AboutUsModel.fromJson(response!.data);
        customToast(
          response!.statusMessage.toString(),
          event.context,
        );
        emit(TermsStateFailed());
      }
    });
  }
}
