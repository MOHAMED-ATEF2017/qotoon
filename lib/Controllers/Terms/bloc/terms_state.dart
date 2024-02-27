import 'package:qotoon/Models/about_us_model.dart';

class TermsState {}

final class TermsStateStart extends TermsState {}

final class TermsStateSuccess extends TermsState {
  final AboutUsModel termsModel;

  TermsStateSuccess({required this.termsModel});
}

final class TermsStateFailed extends TermsState {}
