import 'package:flutter/material.dart';

class HomeEvent {}

class CitiesEventStart extends HomeEvent {
  final BuildContext context;

  CitiesEventStart({required this.context});
}

class OffersEventStart extends HomeEvent {
  final BuildContext context;

  OffersEventStart({required this.context});
}

class SettingEventStart extends HomeEvent {
  final BuildContext context;

  SettingEventStart({required this.context});
}

class DiscoverQotoonEventStart extends HomeEvent {
  final BuildContext context;

  DiscoverQotoonEventStart({required this.context});
}
