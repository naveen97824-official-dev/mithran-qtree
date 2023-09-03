import 'package:qtree/states/login/loginState.dart';

class AppState {
  final LoginState? loginState;

  AppState({required this.loginState});
  factory AppState.initial() {
    return AppState(
      loginState: LoginState.initial(),
    );
  }

  static AppState fromJson(dynamic json) {
    return AppState(
        loginState: (json != null && json["loginState"] != null)
            ? LoginState.fromJson(json["loginState"])
            : LoginState.initial());
  }

  dynamic toJson() =>
      {'loginState': loginState != null ? loginState!.toJson() : null};
}
