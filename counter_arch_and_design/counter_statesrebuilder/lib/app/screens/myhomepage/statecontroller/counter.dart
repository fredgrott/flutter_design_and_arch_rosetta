// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:states_rebuilder/states_rebuilder.dart';

final Injected<int> counter = RM.inject<int>(
  () => 0,
  middleSnapState: (middleSnap) {
    middleSnap.print();

    if (middleSnap.nextSnap.hasData) {
      //Multiply the state by 10
      return middleSnap.nextSnap.copyToHasData(middleSnap.nextSnap.data! * 10);
    }
  },
);