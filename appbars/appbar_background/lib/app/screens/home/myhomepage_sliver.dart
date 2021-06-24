// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ui';

import 'package:appbar_background/app/widgets/background_flexiblespacebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:appbar_background/app/shared/globals.dart';

class MyHomePageSliver extends StatefulWidget {
  const MyHomePageSliver({Key? key, this.title, this.counter}) : super(key: key);
  final String? title;
  final int? counter;
  @override
  State<StatefulWidget> createState() => _MyHomePageSliverState();
}

class _MyHomePageSliverState extends State<MyHomePageSliver> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, __) => <Widget>[
            SliverAppBar(
              expandedHeight:appBarSize,
              // ignore: avoid_redundant_argument_values
              floating: false,
              pinned: true,
              // ignore: avoid_redundant_argument_values
              snap: false,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              flexibleSpace: BackgroundFlexibleSpaceBar(
                title: widget.title != null ? Text(widget.title!) : null,
                centerTitle: false,
                titlePadding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                background: ClipRect(
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        "images/bg.jpg",
                      ),
                      fit: BoxFit.fill,
                    ),),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                const Text(
                  "Photo by Matt Artz on Unsplash",
                ),
                const Text(
                  "You have pushed the button this many times:",
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );

  @override
  void initState() {
    _counter = widget.counter ?? 0;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    if (_counter % 7 == 0) {
      Navigator.of(context).pushReplacement<dynamic, dynamic>(MaterialPageRoute<dynamic>(
        builder: (_) => MyHomePage(
          title: widget.title,
          counter: _counter,
        ),
      ));
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title, this.counter}) : super(key: key);
  final String? title;
  final int? counter;
  @override
  _MyHomePageState createState() =>  _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    _counter = widget.counter ?? 0;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    if (_counter % 5 == 0) {
      Navigator.of(context).pushReplacement<dynamic, dynamic>(MaterialPageRoute<dynamic>(
        builder: (_) => MyHomePageSliver(
          title: widget.title,
          counter: _counter,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title != null ? Text(widget.title!) : null,
        flexibleSpace: ClipRect(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:  AssetImage(
                      "images/bg.jpg",
                    ),
                    fit: BoxFit.fitWidth,),),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Photo by Matt Artz on Unsplash",
            ),
            const Text(
              "You have pushed the button this many times:",
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        
        child: const Icon(Icons.add),
      ),
    );
  }
}
