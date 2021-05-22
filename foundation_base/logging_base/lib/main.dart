import 'package:flutter/material.dart';
import 'package:logging_base/app/myapp.dart';
import 'package:logging_base/app/shared/initlog.dart';
import 'package:logging_base/app/shared/loggertypes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initLog();

  logAFunction("main initialized");

  runApp(MyApp());
}
