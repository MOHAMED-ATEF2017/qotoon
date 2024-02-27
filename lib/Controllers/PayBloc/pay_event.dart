import 'package:flutter/material.dart';
import 'package:qotoon/Controllers/PayBloc/pay_collect_data.dart';

class PayEvent {}

class PayEventStart extends PayEvent {
  final PayCollectData collectData;
  final BuildContext context;
  PayEventStart({required this.collectData, required this.context});
}
