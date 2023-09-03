/*
 * Created Date: Thursday July 18th 2019
 * Author: muthu
 * -----
 * Copyright (c) 2019 Sporfy India Private Limited
 * All rights reserved with Sporfy India Private Limited.
 * Confidential content - Hence Code sharing or copying the code is strictly prohibited outside the organization
 * -----
 * HISTORY:
 * Modified Date 	Last Modified By	Comments
 * --------------	----------------	-------------------------------------------------------
 */

import 'package:qtree/states/appState.dart';
import 'package:redux/redux.dart';

import 'package:redux_persist/redux_persist.dart';

List<Middleware<AppState>> appMiddleWare(Persistor<AppState> persistor) {
  return [
    persistor.createMiddleware(),
  ];
}
