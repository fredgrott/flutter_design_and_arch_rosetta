// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_streams_hooks/app/screens/myhomepage/managers/behavior_stream_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterPage extends HookWidget{
  const CounterPage({Key? key, required this.title, this.message = ""}) : super(key: key);

  final String title;
  final String message ;


  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');

  @override
  Widget build(BuildContext context) {
    final controller = useBehaviorStreamController<int>(keys: [], onCancel: () {  }, onListen: () {  });
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: GestureDetector(
        onTap: () => controller.add( 1),
        child: StreamBuilder<int>(
          stream: controller.stream,
          initialData: 0,
          builder: (context, snapshot) => Text('You tapped me ${snapshot.data} times.'),
        ),
      ),
    );
  }

}