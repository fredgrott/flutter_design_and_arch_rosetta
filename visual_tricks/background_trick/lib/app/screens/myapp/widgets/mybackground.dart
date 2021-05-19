// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MyBackground extends StatefulWidget {
  const MyBackground({Key? key, required this.title, this.message = ""}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String message ;


  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');

  @override
  MyBackgroundState createState() => MyBackgroundState();
}

class MyBackgroundState extends State<MyBackground> with CounterStoreMixin{
  

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(widget.title, key: MyBackground.titleKey,),
            centerTitle: true,
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottomOpacity: 90,
            ) ,
            body: Stack(children: <Widget>[
              Center(
                child: Container(
                  constraints: const BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/background.jpg"),
                      fit: BoxFit.cover,

                    ),

                  ),


                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.message, key: MyBackground.messageKey),
                    Text('$myCounter', style: Theme.of(context).textTheme.headline4,),
                  ],
                ),
              ),
              
            ]),
            floatingActionButton: FloatingActionButton(
              onPressed: incrementCounter,
              tooltip: 'Increment',
              key: const Key('increment'),
              child: const Icon(Icons.add),
            ),
          ) ,

      );
    
    //Scaffold(
      //extendBodyBehindAppBar: true,
      //extendBody: true,
      //resizeToAvoidBottomInset: false,

      //appBar: AppBar(
        // Here we take the value from the MyBackground object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title, key: MyBackground.titleKey,),
        //centerTitle: true,
        //brightness: Brightness.light,
        //backgroundColor: Colors.transparent,
        //elevation: 0,
        //bottomOpacity: 90,


        
      //),
      

      //Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        //child: Column(
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
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: <Widget>[
             //Text(
             //widget.message, key: MyBackground.messageKey,
            //),
            //Text(
             // '$myCounter',
              //style: Theme.of(context).textTheme.headline4,
            //),
          //],
        //),
      //),
      //floatingActionButton: FloatingActionButton(
       // onPressed: incrementCounter,
       // tooltip: 'Increment',
       // key: const Key('increment'),
       // child: const Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    //);
  }
}

class CounterStoreMixin {
  static const int _counter = 0;

  int myCounter = _counter;

  int increaseCounter() {
    return myCounter++;
  }
}
