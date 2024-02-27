import 'package:qotoon/Models/login_model.dart';

class LoginState {}

final class LoginStateStart extends LoginState {}

final class LoginCheckPhoneStateStart extends LoginState {}

final class LoginCheckPhoneStateSuccess extends LoginState {}

final class LoginStateSuccess extends LoginState {
  final LoginModel loginModel;

  LoginStateSuccess({required this.loginModel});
}

final class LoginStateFailed extends LoginState {}
