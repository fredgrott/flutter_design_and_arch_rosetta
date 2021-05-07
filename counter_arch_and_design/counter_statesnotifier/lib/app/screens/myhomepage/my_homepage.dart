// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_statenotifier/app/screens/myhomepage/statecontroller/counter_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title, this.message = ""}) : super(key: key);

  final String title;
  final String message ;


  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
            ),
            Text(
              context.select((MyCounterState value) => value.count).toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: context.watch<MyCounterStateNotifier>().increment,
        // see https://stackoverflow.com/questions/62257064/is-provider-ofcontext-listen-false-equivalent-to-context-read
        onPressed: Provider.of<MyCounterStateNotifier>(context).increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

}
