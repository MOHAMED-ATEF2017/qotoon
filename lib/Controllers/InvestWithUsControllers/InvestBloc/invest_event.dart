import 'package:flutter/material.dart';
import 'package:qotoon/Controllers/InvestWithUsControllers/InvestBloc/invest_collectdata.dart';

class InvestEvent {}

class InvestEventStart extends InvestEvent {
  final BuildContext context;
  final InvestCollectData collectData;

  InvestEventStart({required this.context, required this.collectData});
}
class AreasEventStart extends InvestEvent {
  final BuildContext context;

  AreasEventStart({required this.context, });
}
