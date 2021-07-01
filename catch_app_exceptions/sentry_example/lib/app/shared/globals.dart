// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// For complete web support we can not use asserts here.
// That is the main reason why the catchy example is now 
// archived as it has the asserts way to detect DebugMode.
bool get isInDebugMode {
  bool inDebugMode = false;

  if (kDebugMode) {
    return inDebugMode = true;
  }

  return inDebugMode;
}

const String myDsn = 'https://8b83cb94764f4701bee40028c2f29e72@o447951.ingest.sentry.io/5428562';


final SentryClient sentry = SentryClient(SentryOptions(dsn: myDsn));
