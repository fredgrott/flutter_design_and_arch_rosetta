// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_provider/app/screens/myhomepage/statecontroller/counter_store.dart';
import 'package:counter_provider/app/screens/myhomepage/widgets/count.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message,key: messageKey,),
            const Count(),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),

        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        //onPressed: () => context.read<CounterStore>().increment(),
        // more correct to do this instead of read calls inside of build blocks
        onPressed: () => Provider.of<CounterStore>(context, listen: false).increment(), 
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
