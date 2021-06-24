// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'dart:math';

import 'package:appbar_anim_title/app/shared/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({required Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController scrollController = ScrollController();
  double scrollProgress = 0;

  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {
        scrollProgress = Curves.fastOutSlowIn
            .transform(min(scrollController.offset / kScrollThreshold, 1));
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Opacity(
          opacity: 1 - scrollProgress,
          child: const Text(kTitle),
        ),
        centerTitle: false,
        flexibleSpace: FlexibleSpaceBar(
          title: Opacity(
            opacity: scrollProgress,
            child: const Text(kTitle),
          ),
          centerTitle: true,
        ),
        elevation: kMaxElevation * scrollProgress,
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: 100,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('data$index'),
          );
        },
      ),
    );
  }
}
