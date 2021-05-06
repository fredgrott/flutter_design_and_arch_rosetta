// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_binder/app/screens/myhomepage/statecontroller/counter_store_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:binder/binder.dart';

class MyHomePage extends StatelessWidget {

  const MyHomePage({Key? key, required this.title, this.message = ""}) : super(key: key);

  final String title;
  final String message ;


  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');

  @override
  Widget build(BuildContext context) {

    final dynamic counter = context.watch(counterRef);
   return Scaffold(
      appBar: AppBar(
        title: const Text('Binder Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.use(homeLogicRef).increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
  
  
}
