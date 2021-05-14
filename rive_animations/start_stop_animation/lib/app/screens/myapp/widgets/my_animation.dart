// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';
import 'package:start_stop_animation/app/shared/app_globals.dart';
import 'package:start_stop_animation/app/shared/init_log.dart';

// This has been modified from Rive's recent null-safety examples update.
// Their null-safety knowledge needs some best standards polish, hence my
// modifications.
class MyAnimation extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  // ignore: avoid_unused_constructor_parameters
  const MyAnimation();
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  

  late SimpleAnimation _animation;

  Artboard? myArtboard;

  bool haveArtboard = false;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  Future _loadRiveFile() async {
    // Load your Rive data

    // Create a RiveFile from the binary data
    RiveFile file;
    bytes = await byteAssets.load(riveFileName).then(
      (bytes) async {
        try {
          file = RiveFile.import(bytes);

          final _artboard = file.mainArtboard;
          _artboard.addController(_animation = SimpleAnimation('Animation 1'));
          haveArtboard = true;
          setState(() => myArtboard = _artboard);
        } catch (error) {
          // haveArtboard will be false in this block and we stop
          // execution.
          logger.shout("error: $error");
          throw PlatformException(code: "error: $error");
        }
      },
    );
  }

  /// Toggle animation playback and button states
  void _togglePlayback() {
    // ignore: unnecessary_null_comparison
    if (_animation == null) {
      return;
    }
    setState(() => (_animation.isActive == true)
          ? (isPlaying = true)
          : (isPlaying = false));


  }
    
      

  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          // ignore: avoid_redundant_argument_values
          flex: 1,

          // that way we are not trying to null compare something that
          // can never be null or ever will be null given that I do
          // a throw PlatformException in the _loadRiveFile block
          child: haveArtboard
              // ignore: cast_nullable_to_non_nullable
              ? Rive(artboard: myArtboard as Artboard)
              : const SizedBox(),
        ),
        // I like to use cross-platform stuff rather than MD's FAB
        Flexible(
          // ignore: avoid_redundant_argument_values
          flex: 1,
          child: ElevatedButton(
            onPressed: _togglePlayback,
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ),
      ],
    );
  }
}
