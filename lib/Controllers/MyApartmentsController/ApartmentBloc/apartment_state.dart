import 'package:dio/dio.dart';

class ApartmentBlocState {}

class ApartmentBlocSoldStateStart extends ApartmentBlocState {}

class ApartmentBlocSoldStateSuccess extends ApartmentBlocState {
  final Response response;

  ApartmentBlocSoldStateSuccess({required this.response});
}

class ApartmentBlocSoldStateFailed extends ApartmentBlocState {}

class ApartmentBlocMyStateStart extends ApartmentBlocState {}

class ApartmentBlocMyStateSuccess extends ApartmentBlocState {
  final Response response;

  ApartmentBlocMyStateSuccess({required this.response});
}

class ApartmentBlocMyStateFailed extends ApartmentBlocState {}
