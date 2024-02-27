// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qotoon/Models/cities_model.dart';
import 'package:qotoon/Models/discover_qotoon_model.dart';

import '../../../APIs/Server/api_header.dart';
import '../../../APIs/Server/dio_helper.dart';
import '../../../APIs/apis_urls.dart';
import '../../../Models/home_offer_model.dart';
import '../../../Models/setting.dart';
import '../../../Shared/Components/toast.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    late CitiesModel citiesModel;
    late OffersModel nameModel;
    late SettingModel settingModel;
    late DiscoverQotoonModel discoverQotoonModel;

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

//*************** Offers ****************** */
    on<OffersEventStart>((event, emit) async {
      emit(OffersStateStart());
      response = await DioHelper.getData(
        ApisStrings.offersUrl,
        headers: headersMapWithoutToken(),
      );
      if (response!.statusCode == 200) {
        nameModel = OffersModel.fromJson(response!.data);
        emit(OffersStateSuccess(offersModel: nameModel));
      } else {
        nameModel = OffersModel.fromJson(response!.data);
        customToast(
          response!.statusMessage.toString(),
          event.context,
        );
        emit(OffersStateFailed());
      }
    });

    //*************** setting ****************** */
    on<SettingEventStart>((event, emit) async {
      emit(SettingStateStart());
      response = await DioHelper.getData(
        ApisStrings.settingUrl,
        headers: headersMapWithoutToken(),
      );
      if (response!.statusCode == 200) {
        settingModel = SettingModel.fromJson(response!.data);
        emit(SettingStateSuccess(settingModel: settingModel));
      } else {
        settingModel = SettingModel.fromJson(response!.data);
        customToast(
          response!.statusMessage.toString(),
          event.context,
        );
        emit(SettingStateFailed());
      }
    });

    //*************** discover qotoon ****************** */
    on<DiscoverQotoonEventStart>((event, emit) async {
      emit(DiscoverQotoonStateStart());
      response = await DioHelper.getData(
        ApisStrings.discoverQotoonUrl,
        headers: headersMapWithoutToken(),
      );
      if (response!.statusCode == 200) {
        discoverQotoonModel = DiscoverQotoonModel.fromJson(response!.data);
        emit(DiscoverQotoonStateSuccess(
            discoverQotoonModel: discoverQotoonModel));
      } else {
        discoverQotoonModel = DiscoverQotoonModel.fromJson(response!.data);
        customToast(
          response!.statusMessage.toString(),
          event.context,
        );
        emit(DiscoverQotoonStateFailed());
      }
    });
  }
}
