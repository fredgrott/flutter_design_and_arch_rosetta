// Original Code is by Cosmos Software | Ali Yigit Bireroglu under MIT License.
//
// My modifications are under my copyright and BSD-clause 2 license.
// Fredrick Allan Grott  copyright 2021                                                                                                       

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spring_button/app/spring_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Sequence Animator Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Image Sequence Animator Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer? timer;
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  Widget row(String text, Color color) {
    return Padding(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.all(12.5),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          // ignore: unnecessary_const
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  // ignore: long-method
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title!)),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                counter.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            // ignore: avoid_redundant_argument_values
            flex: 1,
            child: SpringButton(
              SpringButtonType.onlyScale,
              row(
                "Increment",
                Colors.deepPurpleAccent,
              ),
              onTapDown: (_) => incrementCounter(),
              onLongPress: () => timer = Timer.periodic(
                const Duration(milliseconds: 100),
                (_) => incrementCounter(),
              ),
              onLongPressEnd: (_) {
                timer?.cancel();
              },
            ),
          ),
          Expanded(
            // ignore: avoid_redundant_argument_values
            flex: 1,
            child: SpringButton(
              SpringButtonType.onlyScale,
              row(
                "Decrement",
                Colors.redAccent,
              ),
              onTapDown: (_) => decrementCounter(),
              onLongPress: () => timer = Timer.periodic(
                const Duration(milliseconds: 100),
                (_) => decrementCounter(),
              ),
              onLongPressEnd: (_) {
                timer?.cancel();
              },
            ),
          ),
        ],
      ),
    );
  }
}

