import 'package:qtree/models/login/loginModel.dart';

class LoginState {
  UserLogin? userDetail;

  LoginState({this.userDetail});

  factory LoginState.initial() {
    return new LoginState(
      userDetail: null,
    );
  }

  static LoginState fromJson(dynamic json) {
    return LoginState(
      userDetail: json['userDetail'] != null
          ? UserLogin.fromJson(json['userDetail'])
          : null,
    );
  }

  LoginState copyWith({
    UserLogin? user,
  }) {
    this.userDetail = user;
    return this;
  }

  dynamic toJson() => {
        'userDetail': userDetail != null ? userDetail!.toJson() : null,
      };
}
