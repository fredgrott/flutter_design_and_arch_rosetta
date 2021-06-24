// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore: unused_import
import 'package:logging/logging.dart';


// This requires Dart 2.13 as we are using the typedef generics for functions
typedef LoggerMyAppName<String, Logger> = Logger Function(String myAppName);

