import 'package:flutter/material.dart';

class ReversationEvent {}

class ReversationEventStart extends ReversationEvent {
  final BuildContext context;
  final String status;

  ReversationEventStart({required this.context, required this.status});
}
