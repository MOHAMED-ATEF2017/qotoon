// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kiwi/kiwi.dart';
import 'package:path/path.dart' as path;

import '../../../APIs/Server/api_header.dart';
import '../../../APIs/Server/dio_helper.dart';
import '../../../APIs/apis_urls.dart';
import '../../../Models/areas_model.dart';
import '../../../Shared/Components/toast.dart';
import '../../../Shared/logger.dart';
import '../cubit/invest_cubit.dart';
import 'invest_event.dart';
import 'invest_state.dart';

class InvestBloc extends Bloc<InvestEvent, InvestState> {
  InvestBloc() : super(InvestState()) {
    Response? response;
    final InvestCubit investCubit = KiwiContainer().resolve<InvestCubit>();
    var request = http.MultipartRequest("POST",
        Uri.parse('${ApisStrings.qotoonBaseUrl}/${ApisStrings.investUserUrl}'));
    List<http.MultipartFile> newList = [];

    //********* post invest data************** */
    on<InvestEventStart>((event, emit) async {
      for (var img in investCubit.aqarImages) {
        if (img != null) {
          var multipartFile = await http.MultipartFile.fromPath(
            'images[]',
            File(img.path).path,
            filename: path.basename(img.path),
          );
          newList.add(multipartFile);
        }
      }
      emit(InvestStateStart());
      request.files.addAll(newList);
      request.fields.addAll({
        "name": event.collectData.name!,
        "bathrooms": event.collectData.bathrooms!,
        "lounges": event.collectData.lounges!,
        "view": event.collectData.view!,
        "area_id": event.collectData.cityID!,
        "max_rooms": event.collectData.maxRooms!,
        "price": event.collectData.price!,
      });
      request.headers.addAll(headersData);
      await request.send().then((value) {
        if (value.statusCode == 200) {
          value.stream.transform(utf8.decoder).listen((event) {
            Map<String, dynamic> body = json.decode(value.toString());
            logger.f(body);
          });
          customToast(
            value.stream.toString(),
            event.context,
          );
          emit(InvestStateSuccess());
        } else {
          value.stream.transform(utf8.decoder).listen((_) {
            logger.f(_);
            customToast(
              _.split(",").first,
              event.context,
            );
          });

          emit(InvestStateFailed());
        }
      });
    });

//************** get areas ******************** */
    late AreasModel nameModel;
    on<AreasEventStart>((event, emit) async {
      emit(AreaStateStart());
      response = await DioHelper.getData(
        ApisStrings.areasUrl,
        headers: headersMapWithoutToken(),
      );
      if (response!.statusCode == 200) {
        nameModel = AreasModel.fromJson(response!.data);
        emit(AreaStateSuccess(areaModels: nameModel));
      } else {
        nameModel = AreasModel.fromJson(response!.data);
        customToast(
          response!.statusMessage.toString(),
          event.context,
        );
        emit(AreaStateFailed());
      }
    });
  }
}
