import 'package:qotoon/Models/login_model.dart';

class UpdateProfileState {}

class UpdateProfileStateStart extends UpdateProfileState {}

class UpdateProfileStateFailed extends UpdateProfileState {}

class UpdateProfileStateSuccess extends UpdateProfileState {
  final LoginData loginData;

  UpdateProfileStateSuccess({required this.loginData});
}
