// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qotoon/Screens/SearchScreens/search_results_screen.dart';

import '../../../APIs/Server/api_header.dart';
import '../../../APIs/Server/dio_helper.dart';
import '../../../APIs/apis_urls.dart';
import '../../../Models/search_model.dart';
import '../../../Shared/Components/toast.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  late SearchModel searchModel;
  Response? response;

  SearchBloc() : super(SearchState()) {
    on<SearchEventStart>((event, emit) async {
      emit(SearchStateStart());
      response = await DioHelper.postData(
        ApisStrings.searchUrl,
        data: event.collectData.toJson(),
        headers: headersMapWithoutToken(),
      );
      if (response!.statusCode == 200) {
        searchModel = SearchModel.fromJson(response!.data);
        Navigator.of(event.context).push(MaterialPageRoute(
          builder: (context) =>
              SearchResultsScreen(data: jsonEncode(response!.data), 
              inDate: event.collectData.checkInData!,
              outDate: event.collectData.checkOutData!,
              ),
        ));
        // event.context.go(Uri(
        //     path: SearchResultsScreen.searchResultsScreenRoute,
        //     queryParameters: {"data": jsonEncode(response!.data)}).toString());
        emit(SearchStateSuccess(searchModel: searchModel));
      } else {
        searchModel = SearchModel.fromJson(response!.data);
        customToast(
          searchModel.error == ''
              ? searchModel.message.checkOutDate.toString()
              : searchModel.error,
          event.context,
        );
        emit(SearchStateFailed());
      }
    });
  }
}
