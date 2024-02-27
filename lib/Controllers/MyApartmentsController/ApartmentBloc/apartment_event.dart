import 'package:flutter/material.dart';

class ApartmentBlocEvent {}

class ApartmentBlocSoldEventStart extends ApartmentBlocEvent {
  final BuildContext context;

  ApartmentBlocSoldEventStart({required this.context});
}

class ApartmentBlocMyEventStart extends ApartmentBlocEvent {
  final BuildContext context;

  ApartmentBlocMyEventStart({required this.context});
}
