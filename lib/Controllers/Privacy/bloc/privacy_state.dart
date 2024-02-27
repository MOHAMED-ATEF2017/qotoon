import 'package:qotoon/Models/about_us_model.dart';

class PrivacyState {}

final class PrivacyStateStart extends PrivacyState {}

final class PrivacyStateSuccess extends PrivacyState {
  final AboutUsModel privacyModel;

  PrivacyStateSuccess({required this.privacyModel});
}

final class PrivacyStateFailed extends PrivacyState {}
