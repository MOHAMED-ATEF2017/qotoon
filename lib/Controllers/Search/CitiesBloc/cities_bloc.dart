// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../APIs/Server/api_header.dart';
import '../../../APIs/Server/dio_helper.dart';
import '../../../APIs/apis_urls.dart';
import '../../../Models/cities_model.dart';
import '../../../Shared/Components/toast.dart';
import 'cities_event.dart';
import 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesBloc() : super(CitiesState()) {
    late CitiesModel citiesModel;
    Response? response;

    on<CitiesEventStart>((event, emit) async {
      emit(CitiesStateStart());
      response = await DioHelper.getData(
        ApisStrings.citiesUrl,
        headers: headersMapWithoutToken(),
      );
      if (response!.statusCode == 200) {
        citiesModel = CitiesModel.fromJson(response!.data);
        emit(CitiesStateSuccess(citiesModel: citiesModel));
      } else {
        citiesModel = CitiesModel.fromJson(response!.data);
        customToast(
          response!.statusMessage.toString(),
          event.context,
        );
        emit(CitiesStateFailed());
      }
    });
  }
}
