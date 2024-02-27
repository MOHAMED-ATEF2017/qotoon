import 'package:qotoon/Models/cities_model.dart';

class CitiesState {}

final class CitiesStateStart extends CitiesState {}

final class CitiesStateSuccess extends CitiesState {
  final CitiesModel citiesModel;

  CitiesStateSuccess({required this.citiesModel});
}

final class CitiesStateFailed extends CitiesState {}
