// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

abstract class NetworkInfo {
  /// Function that return `true` if there is connection to internet
  /// otherwise returns `false`
  Future<bool> get isConnected;
}
