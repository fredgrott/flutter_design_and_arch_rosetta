// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_inheritedwidget/app/screens/myhomepage/statecontroller/counter_widget.dart';
import 'package:counter_inheritedwidget/app/screens/myhomepage/statecontroller/inhertied_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatelessWidget {

  const MyHomePage({Key? key, required this.title, this.message = ""}) : super(key: key);

  final String title;
  final String message ;


  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');



  @override
  Widget build(BuildContext context) {
    
    return CounterWidget(
      key: const Key("counter"),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
         ),
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(message, key: MyHomePage.messageKey,),
               Builder(builder: (context) {
                 // ignore: cast_nullable_to_non_nullable
                 final inherited = context.dependOnInheritedWidgetOfExactType<InheritedCounter>() as InheritedCounter;
                 return Text(
                   '${inherited.state.count}',
                     style: Theme.of(context).textTheme.headline4,
                 );
               }),
               Builder(builder: (context) {
                 // ignore: cast_nullable_to_non_nullable
                 final ancestor = context.findAncestorWidgetOfExactType<InheritedCounter>() as InheritedCounter;
                 return ElevatedButton(
                   onPressed: () => ancestor.state.incrementCount(),
                   child: const Text("Increment"),
                 );
               }),
             ]
           )
         )
    ));
    
  }
}
