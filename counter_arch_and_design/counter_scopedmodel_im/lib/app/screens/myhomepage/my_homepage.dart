// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_scopedmodel_im/app/screens/myhomepage/statecontroller/abstract_model_store.dart';
import 'package:counter_scopedmodel_im/app/shared/app_globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title, this.message = ""})
      : super(key: key);

  final String title;
  final String message;

  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        key: titleKey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              myHomepageMessage,
              key: messageKey,
            ),
            ScopedModelDescendant<AbstractModelStore>(
              builder: (context, child, model) => Text(
                model.counter.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ]
        )
      ),
      floatingActionButton: ScopedModelDescendant<AbstractModelStore>(
        builder: (context, child, model) => FloatingActionButton(
          onPressed: model.increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),

    );
  }
}
