// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:looping_animation/app/screens/myapp/widgets/pong_animation.dart';
import 'package:looping_animation/app/shared/app_globals.dart';
import 'package:lumberjack/lumberjack.dart';


import 'package:rive/rive.dart';

class MyAnimation extends StatefulWidget {
  const MyAnimation({Key? key}) : super(key: key);

  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  RiveAnimationController? _controller;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load(riveFileName).then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        // Add a controller to play back a known animation on the main/default
        // artboard. We store a reference to it so we can toggle playback.
        artboard.addController(_controller = PongAnimation('Animation 1'));
        // need to start with false so controller is paused

        

        setState(() => _riveArtboard = artboard);
      },
    ).onError((error, stackTrace) => handleError(error));
  }

  // ignore: prefer-trailing-comma
  // ignore: prefer_void_to_null
  Future<Null> handleError(Object? error) {
    logAFunction("error: $error");
    throw PlatformException(code: "rive error");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Rive(artboard: _riveArtboard!),
      ),
    );
  }
}
