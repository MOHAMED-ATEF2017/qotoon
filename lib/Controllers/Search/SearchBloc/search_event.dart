import 'package:flutter/material.dart';
import 'package:qotoon/Controllers/Search/SearchBloc/search_collect_data.dart';

class SearchEvent {}

class SearchEventStart extends SearchEvent {
  final SearchCollectData collectData;
  final BuildContext context;

  SearchEventStart( {required this.collectData,required this.context});
}
