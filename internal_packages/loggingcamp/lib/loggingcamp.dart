library loggingcamp;

export 'appenders/my_devlogappender.dart';
export 'appenders/my_releaselogappender.dart';
export 'formatters/my_devlogrecord_formatter.dart';
export 'formatters/my_releaselogrecord_formatter.dart';
export 'types/appender_types.dart';
export 'types/loggingcamp_types.dart';
export 'utils/app_init_log.dart';


// HOW TO USE:
//
// In the main function
// ```
// main(){
//  appInitLog()
// }
// ```

//
// Then to log already defined levels it's
// ```
// appLogger.info(message);
// ```
// To get log areas for screen widgets use the UILoggerMixin and the myNewLogger or the myDetachedLogger