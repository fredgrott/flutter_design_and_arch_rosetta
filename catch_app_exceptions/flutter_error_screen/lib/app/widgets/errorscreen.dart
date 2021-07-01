// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// errorScreen user flutter error screen
/// @author Fredrick Allan Grott
Widget errorScreen(dynamic detailsException) {

  return Scaffold(

    appBar: AppBar(
      title: const Text('Error'),
      ),

    body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
            //Check is it release mode
            kReleaseMode
            //Widget for release mode
            ?const Center(child: Text('Sorry for inconvenience',style: TextStyle(fontSize: 24.0),),)
            //Widget for debug mode
            :SingleChildScrollView(child: Text('Exception Details:\n\n$detailsException')),
      ),
  );

}