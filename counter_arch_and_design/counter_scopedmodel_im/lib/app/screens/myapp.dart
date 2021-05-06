// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_scopedmodel_im/app/screens/myhomepage/my_homepage.dart';
import 'package:counter_scopedmodel_im/app/screens/myhomepage/statecontroller/abstract_model_store.dart';
import 'package:counter_scopedmodel_im/app/shared/app_globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class MyApp extends StatelessWidget {

  final AbstractModelStore model;

  const MyApp({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return ScopedModel<AbstractModelStore>(
      model: model,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage(title: myAppTitle,),
      ),
    );
  }


}
