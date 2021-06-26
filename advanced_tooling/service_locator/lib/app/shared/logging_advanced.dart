// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:logging/logging.dart';
import 'package:service_locator/app/shared/globals.dart';


// our Logging Interface, hence the use of the term Adaptor
abstract class MyLogging {
  Logger get appLogger;
}

class MyLoggingAdaptor implements MyLogging{


  @override
  // TODO: implement appLogger
  Logger get appLogger => Logger(appName);
  
}


class MyLoggingAdaptorTwo implements MyLogging{

  MyLoggingAdaptorTwo();

  @override
  // TODO: implement appLogger
  Logger get appLogger => Logger(appName);
  
}