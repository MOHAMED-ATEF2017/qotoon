// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qotoon/Models/about_us_model.dart';

import '../../../APIs/Server/api_header.dart';
import '../../../APIs/Server/dio_helper.dart';
import '../../../APIs/apis_urls.dart';
import '../../../Shared/Components/toast.dart';
import 'about_us_event.dart';
import 'about_us_state.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  AboutUsBloc() : super(AboutUsState()) {
    late AboutUsModel aboutUsModel;
    Response? response;
    on<AboutUsEventStart>((event, emit) async {
      emit(AboutUsStateStart());
      response = await DioHelper.getData(
        ApisStrings.aboutUsUrl,
        headers: headersMapWithoutToken(),
      );
      if (response!.statusCode == 200) {
        aboutUsModel = AboutUsModel.fromJson(response!.data);
        emit(AboutUsStateSuccess(aboutUsModel: aboutUsModel));
      } else {
        aboutUsModel = AboutUsModel.fromJson(response!.data);
        customToast(
          response!.statusMessage.toString(),
          event.context,
        );
        emit(AboutUsStateFailed());
      }
    });
  }
}
