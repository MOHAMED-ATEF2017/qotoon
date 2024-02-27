import 'package:qotoon/Models/login_model.dart';

class GetUserState {}

class GetUserStateStart extends GetUserState {}

class GetUserStateSuccess extends GetUserState {
  final LoginData loginData;

  GetUserStateSuccess({required this.loginData});
}

class GetUserStateFailed extends GetUserState {}
