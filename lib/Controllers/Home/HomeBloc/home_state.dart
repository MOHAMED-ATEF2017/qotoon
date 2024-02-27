import 'package:qotoon/Models/cities_model.dart';

import '../../../Models/discover_qotoon_model.dart';
import '../../../Models/home_offer_model.dart';
import '../../../Models/setting.dart';

class HomeState {}

final class CitiesStateStart extends HomeState {}

final class OffersStateStart extends HomeState {}

final class SettingStateStart extends HomeState {}

final class DiscoverQotoonStateStart extends HomeState {}

final class CitiesStateSuccess extends HomeState {
  final CitiesModel citiesModel;

  CitiesStateSuccess({required this.citiesModel});
}

final class OffersStateSuccess extends HomeState {
  final OffersModel offersModel;

  OffersStateSuccess({required this.offersModel});
}

final class SettingStateSuccess extends HomeState {
  final SettingModel settingModel;

  SettingStateSuccess({required this.settingModel});
}

final class DiscoverQotoonStateSuccess extends HomeState {
  final DiscoverQotoonModel discoverQotoonModel;

  DiscoverQotoonStateSuccess({required this.discoverQotoonModel});
}

final class CitiesStateFailed extends HomeState {}

final class OffersStateFailed extends HomeState {}

final class SettingStateFailed extends HomeState {}

final class DiscoverQotoonStateFailed extends HomeState {}
