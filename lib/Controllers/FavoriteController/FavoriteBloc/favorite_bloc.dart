// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../APIs/Server/api_header.dart';
import '../../../APIs/Server/dio_helper.dart';
import '../../../APIs/apis_urls.dart';
import '../../../Shared/Components/toast.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState()) {
    late List<dynamic> nameModel;
    Response? response;
    on<FavoriteEventStart>((event, emit) async {
      emit(FavoriteStateStart());
      response = await DioHelper.getData(
        ApisStrings.favoriteUserUrl,
        headers: headersMapWithToken(),
      );
      if (response!.statusCode == 200) {
        nameModel = response!.data['data'];
        emit(FavoriteStateSuccess(data: nameModel));
      } else {
        customToast(
          response!.statusMessage.toString(),
          event.context,
        );
        emit(FavoriteStateFailed());
      }
    });
  }
}
