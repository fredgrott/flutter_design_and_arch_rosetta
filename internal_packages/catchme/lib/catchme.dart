library catchme;

import 'package:catcher/catcher.dart';



ReportMode reportMode = PageReportMode(showStackTrace: true);

final CatcherOptions debugOptions = CatcherOptions(
  reportMode,
  [
    ConsoleHandler(
      // ignore: avoid_redundant_argument_values
      enableApplicationParameters: true,
      // ignore: avoid_redundant_argument_values
      enableDeviceParameters: true,
      enableCustomParameters: true,
      // ignore: avoid_redundant_argument_values
      enableStackTrace: true,
    )
  ],
  screenshotsPath: "",
);

final CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
  EmailManualHandler(
      [
        "email1@email.com",
        "email2@email.com",
      ],
      // ignore: avoid_redundant_argument_values
      enableDeviceParameters: true,
      // ignore: avoid_redundant_argument_values
      enableStackTrace: true,
      // ignore: avoid_redundant_argument_values
      enableCustomParameters: true,
      // ignore: avoid_redundant_argument_values
      enableApplicationParameters: true,
      // ignore: avoid_redundant_argument_values
      sendHtml: true,
      emailTitle: "Sample Title",
      emailHeader: "Sample Header",
      printLogs: true,
    )

]);
