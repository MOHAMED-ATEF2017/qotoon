import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  SearchCubit() : super(SearchLocationStateSuccess());
  String searchLocation = '', arriveDate = '', leavingDate = '';
  int adult = 1, children = 0;
  final GlobalKey<FormState> formKey = GlobalKey();
  void changeSearchLocation(String value) {
    searchLocation = value;
    emit(SearchLocationStateSuccess());
  }

  void changeArrivingDate(String value) {
    arriveDate = value;
    emit(SearchArrivingDateStateSuccess());
  }

  void changeLeavingDate(String value) {
    leavingDate = value;
    emit(SearchLeavingDateStateSuccess());
  }

  void addAdultNo() {
    adult++;
    emit(SearchAdultStateSuccess());
  }

  void minusAdultNo() {
    adult == 1 ? null : adult--;
    emit(SearchAdultStateSuccess());
  }

  void addChildrenNo() {
    children++;
    emit(SearchChildrenStateSuccess());
  }

  void minusChildrenNo() {
    children == 0 ? null : children--;
    emit(SearchChildrenStateSuccess());
  }
}
