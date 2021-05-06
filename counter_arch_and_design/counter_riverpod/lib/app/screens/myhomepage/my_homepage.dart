// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_riverpod/app/screens/myhomepage/statecontroller/counter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      appBar: AppBar(title:  Text(title, key: titleKey,)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message, key: MyHomePage.messageKey,
            ),
            Consumer(builder: (context, watch, _) {
              final count = watch(counterProvider).state;
              return Text('$count');
            })
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is an utility to read a provider without listening to it
        onPressed: () => context.read(counterProvider).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
