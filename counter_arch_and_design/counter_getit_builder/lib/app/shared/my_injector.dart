// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:get_it/get_it.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

GetIt getIt = GetIt.asNewInstance();

GetIt myInjector() {
  

  return getIt;
}


final Injected<int> counter = RM.inject<int>(
  () => 0,
  middleSnapState: (middleSnap) {
    middleSnap.print();
  },
);