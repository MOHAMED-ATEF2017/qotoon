import 'package:qotoon/Models/about_us_model.dart';

class AboutUsState {}

final class AboutUsStateStart extends AboutUsState {}

final class AboutUsStateSuccess extends AboutUsState {
  final AboutUsModel aboutUsModel;

  AboutUsStateSuccess({required this.aboutUsModel});
}

final class AboutUsStateFailed extends AboutUsState {}
