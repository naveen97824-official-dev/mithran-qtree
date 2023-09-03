import 'dart:async';

import 'package:qtree/models/login/loginModel.dart';
import 'package:qtree/states/appState.dart';
import 'package:redux/redux.dart';

class LoginPageViewModel {
  // Add your state and logic here
  Store<AppState>? store1;
  UserLogin userData = UserLogin();
  StreamController loginButtonBuilder = StreamController();
}
