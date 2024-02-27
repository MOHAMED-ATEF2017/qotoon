import 'package:qotoon/Models/areas_model.dart';

class InvestState {}

final class InvestStateStart extends InvestState {}

final class InvestStateSuccess extends InvestState {}

final class InvestStateFailed extends InvestState {}

final class AreaStateStart extends InvestState {}

final class AreaStateSuccess extends InvestState {
  final AreasModel areaModels;

  AreaStateSuccess({required this.areaModels});
}

final class AreaStateFailed extends InvestState {}


final class DeleteAqarImagesState extends InvestState {}
