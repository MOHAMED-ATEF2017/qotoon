// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../APIs/Server/api_header.dart';
import '../../../APIs/Server/dio_helper.dart';
import '../../../APIs/apis_urls.dart';
import '../../../Shared/Components/toast.dart';
import 'apartment_event.dart';
import 'apartment_state.dart';

class ApartmentBloc extends Bloc<ApartmentBlocEvent, ApartmentBlocState> {
  ApartmentBloc() : super(ApartmentBlocState()) {
    late Response response;
//*********** Sold apartments************
    on<ApartmentBlocSoldEventStart>((event, emit) async {
      emit(ApartmentBlocSoldStateStart());
      response = await DioHelper.getData(
        ApisStrings.soldApartmentsUrl,
        headers: headersMapWithToken(),
      );
      if (response.statusCode == 200) {
        emit(ApartmentBlocSoldStateSuccess(response: response));
      } else {
        customToast(
          response.data['error'] ?? response.statusMessage.toString(),
          event.context,
        );
        emit(ApartmentBlocSoldStateFailed());
      }
    });
//*********** my apartments************
    on<ApartmentBlocMyEventStart>((event, emit) async {
      emit(ApartmentBlocMyStateStart());
      response = await DioHelper.getData(
        ApisStrings.myApartmentsUrl,
        headers: headersMapWithToken(),
      );
      if (response.statusCode == 200) {
        emit(ApartmentBlocMyStateSuccess(response: response));
      } else {
        customToast(
          response.data['error'] ?? response.statusMessage.toString(),
          event.context,
        );
        emit(ApartmentBlocMyStateFailed());
      }
    });
  }
}
