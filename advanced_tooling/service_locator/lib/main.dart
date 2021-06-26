import 'package:flutter/material.dart';
import 'package:service_locator/app/myapp.dart';
import 'package:service_locator/app/shared/logging_advanced.dart';
import 'package:service_locator/app/shared/service_locator.dart';

void main() {
  final sl =
      ServiceLocator(); // this is the same as ServiceLocator.sharedContainer
  

  sl.registerFactory<MyLogging>((container) => MyLoggingAdaptor());
  sl.registerFactory1<MyLoggingAdaptor, String>(
    (container, title) => MyLoggingAdaptor(),
  );

  final MyLogging myLog = sl.resolve();

  myLog.appLogger.info('test resolve');

  final MyLogging myLog1 =
      sl.resolve1<MyLoggingAdaptor, String>('Some Logger Name');
  myLog1.appLogger.info('test resolve1');

  

  

  runApp(MyApp());
}
