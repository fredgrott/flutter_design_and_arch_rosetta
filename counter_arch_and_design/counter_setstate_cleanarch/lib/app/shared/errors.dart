// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:equatable/equatable.dart';

/// Server Exception
class ServerException implements Exception {}

/// Server Exception
class CacheException implements Exception {}

///Abstract class that models the most common failures scenarios of app
abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

/// Server Failure
class ServerFailure extends Failure {}

/// Cache Failure
class CacheFailure extends Failure {}
