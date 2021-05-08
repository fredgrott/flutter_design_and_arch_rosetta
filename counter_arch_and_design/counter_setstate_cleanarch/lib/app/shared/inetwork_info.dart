// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_setstate_cleanarch/app/shared/data_connection_checker.dart';
import 'package:counter_setstate_cleanarch/app/shared/network_info.dart';


class INetworkInfo implements NetworkInfo {
  ///Constructor for NetworkInfo Implementation
  INetworkInfo(this._connectionChecker);

  final DataConnectionChecker _connectionChecker;

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}
