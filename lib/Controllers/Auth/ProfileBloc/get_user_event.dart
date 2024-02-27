import 'package:flutter/material.dart';

class GetUserEvent {}

class GetUserEventStart extends GetUserEvent {
  final BuildContext context;

  GetUserEventStart({required this.context});
}
