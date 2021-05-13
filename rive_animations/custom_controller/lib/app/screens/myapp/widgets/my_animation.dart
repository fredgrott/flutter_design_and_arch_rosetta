// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:custom_controller/app/shared/app_globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class CompletingAnimation extends SimpleAnimation {
  CompletingAnimation(String animationName, {required double mix})
      : super(animationName, mix: mix);

  /// Tracks whether the animation should enter a paused state at the end of the
  /// current animation cycle
  bool _pause = false;
  bool get pause => _pause;
  set pause(bool value) {
    _pause = value;
    // Start immediately if un-paused
    if (!value) {
      isActive = true;
    }
  }

  /// Pauses at the end of an animation loop if _pause is true
  void _pauseAtEndOfAnimation() {
    // Calculate the start time of the animation, which may not be 0 if work
    // area is enabled
    final start =
        instance!.animation.enableWorkArea ? instance!.animation.workStart : 0;
    // Calculate the frame the animation is currently on
    final currentFrame = (instance!.time - start) * instance!.animation.fps;
    // If the animation is within the window of a single frame, pause
    if (currentFrame <= 1) {
      isActive = false;
    }
  }

  @override
  void apply(RuntimeArtboard artboard, double elapsedSeconds) {
    // Apply the animation to the artboard with the appropriate level of mix
    instance!.animation.apply(instance!.time, coreContext: artboard, mix: mix);

    // If pause has been requested, try to pause
    if (_pause) {
      _pauseAtEndOfAnimation();
    }

    // If false, the animation has ended (it doesn't loop)
    if (!instance!.advance(elapsedSeconds)) {
      isActive = false;
    }
  }
}



class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  
  late CompletingAnimation _wipersAnimation;
  

  // Is the bounce animation paused
  var _isPaused = false;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  Future _loadRiveFile() async {
    // Load your Rive data
    final data = await byteAssets.load(riveFileName);
    // Create a RiveFile from the binary data
    RiveFile file;
    if (bytes.buffer.lengthInBytes.isFinite) {
      file = RiveFile.import(bytes);
      final Artboard artboard = file.mainArtboard;

      // Idle plays continuously so we can use a SimpleAnimation
      artboard.addController(SimpleAnimation('idle'));
      // Bouncing can be paused and we want it to play to the end of the bounce
      // animation when complete, so let's use our custom controller
      artboard.addController(
        _wipersAnimation = CompletingAnimation('windshield_wipers', mix: 0),
      );

      // Wrapped in setState so the widget knows the artboard is ready to play
      setState(() => myArtboard = artboard);
    } else {
      throw PlatformException(code: "rive asset loading problem");
    }
  }

  /// Sets the level of bounciness
  void _pause() =>
      setState(() => _wipersAnimation.pause = _isPaused = !_isPaused);

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
            onPressed: _pause,
            child: Text(_isPaused ? 'Play' : 'Pause'),
          ),
        ),
      ],
    );
  }
}