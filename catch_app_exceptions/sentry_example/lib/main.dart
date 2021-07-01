import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sentry_example/app/myapp.dart';
import 'package:sentry_example/app/widgets/errorscreen.dart';

// I disagree with Google on whether or not the Future async pair
// use in that I feel it should be used as we generally have
// services both local and not to initialize. Google only has in
// their catchy archive see: https://github.com/flutter/crashy/blob/master/lib/main.dart
// Google Flutter Docs show with out using
// the Future async pairing

// change to your own damn DNS sentry thing
const String _exampleDsn = 'https://8b83cb94764f4701bee40028c2f29e72@o447951.ingest.sentry.io/5428562';


// ignore: prefer_void_to_null
Future<Null> main() async {
  // ignore: prefer_void_to_null
  runZonedGuarded<Future<Null>>(
    () async {
      //Since we start another zone we need to
      //ensure that SkyEngine has fully loaded Flutter
      // and it needs to be called here to enable grabbing the errors
      //as we can only grab the flutter errors when the flutter 
      // framework is initialized
      WidgetsFlutterBinding.ensureInitialized();
      // Service and other initializations here
      ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) =>
          errorScreen(flutterErrorDetails.exception);
      runApp(const MyApp());
    },
    // ignore: no-empty-block
    (Object error, StackTrace stack) {
      // myBackend.sendError(error, stack);
    },
  );
}
