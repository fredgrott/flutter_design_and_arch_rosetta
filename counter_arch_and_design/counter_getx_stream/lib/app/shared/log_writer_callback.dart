// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:counter_getx_stream/app/shared/init_log.dart';

class MyLogWriterCallback {
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => logger.severe('** $text. isError: [$isError]'));
  }
}
