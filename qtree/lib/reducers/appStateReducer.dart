import 'package:qtree/reducers/login/loginReducer.dart';
import 'package:qtree/states/appState.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    loginState: loginReducer(state.loginState!, action),
  );
}
