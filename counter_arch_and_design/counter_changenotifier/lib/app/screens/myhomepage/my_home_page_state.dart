// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:counter_changenotifier/app/screens/myhomepage/my_home_page.dart';
import 'package:counter_changenotifier/app/screens/myhomepage/statecontroller/counter_store_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// This is a state container as evidenced by the included 
/// setState() function(method). It just so happens it also 
/// builds the screen set of widgets to HomePage.
/// 
/// Part of the evolution of Arch and State solutions and choices 
/// in Flutter is the implied goal to reduce  this state 
/// container to just setting up state and building the screen 
/// without having business-domain logic embedded in it as when 
/// you do that you get very fact and hard to test screens.
///
/// @author Fredrick Allan Grott
class MyHomePageState extends State<MyHomePage> with CounterStoreMixin{
  

  void incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      increaseCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, key: MyHomePage.titleKey,),
        
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              widget.message, key: MyHomePage.messageKey,
            ),
            Text(
              '$myCounter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        key: const Key('increment'),
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}