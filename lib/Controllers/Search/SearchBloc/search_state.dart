import 'package:qotoon/Models/search_model.dart';

class SearchState {}

final class SearchStateStart extends SearchState {}

final class SearchStateSuccess extends SearchState {
  final SearchModel searchModel;

  SearchStateSuccess({required this.searchModel});
}

final class SearchStateFailed extends SearchState {}
