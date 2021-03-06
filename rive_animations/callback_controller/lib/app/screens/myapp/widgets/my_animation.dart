// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:callback_controller/app/screens/myapp/widgets/callback_animation.dart';
import 'package:callback_controller/app/shared/app_globals.dart';
import 'package:callback_controller/app/shared/init_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  // use bytes.buffer.lengthInBytes.isFinite as that returns a bool in the if condition
  Future _loadRiveFile() async {
    // Load your Rive data

    // waits here until completes, rest is not executed until this
    // completes

    RiveFile file;
    // doing the pre-cache here, as the catch exceptions stuff catches any 
    // exception such as pre-caching not working.
    bytes = await byteAssets.load(riveFileName);
    if (bytes.buffer.lengthInBytes.isFinite) {
      file = RiveFile.import(bytes);
      final Artboard artboard = file.mainArtboard;
      artboard.addController(
        myAnimation = CallbackAnimation(
          'Untitled',
          callback: () => setState(() => isAnimationComplete = true),
          mix: 0,
        ),
      );
      setState(() => myArtboard = artboard);
    } else {
      // we need to throw an error exception if it fails to load
      // and in a real app one would log it.
      logger.shout("failed to load rive asset file");
      throw PlatformException(code: "rive loading error");
      
    }
  }

  void _replay() {
    myAnimation.resetAndStart(myArtboard as RuntimeArtboard);
    setState(() => isAnimationComplete = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 3,
          // ignore: unnecessary_null_comparison
          child: myArtboard != null ? Rive(artboard: myArtboard) : Container(),
        ),
        Flexible(
          // ignore: avoid_redundant_argument_values
          flex: 1,
          child: ElevatedButton(
            onPressed: isAnimationComplete ? _replay : null,
            child: Text(isAnimationComplete ? 'Replay' : 'Running'),
          ),
        ),
      ],
    );
  }
}
