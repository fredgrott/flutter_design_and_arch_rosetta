// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';
import 'package:start_stop_animation/app/shared/app_globals.dart';

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  // The artboard we'll use to play an animation
  
  late SimpleAnimation _animation;
  var _playing = true;
  

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  
  Future _loadRiveFile() async {
    // Load your Rive data
    
    // Create a RiveFile from the binary data
    RiveFile file;
    if (bytes.buffer.lengthInBytes.isFinite) {
      file = RiveFile.import(bytes);
      final Artboard artboard = file.mainArtboard;

      // Create a SimpleAnimation controller for the animation you want to play
      // and attach it to the artboard. Keep a reference to the controller to
      // start and stop it.
      artboard.addController(_animation = SimpleAnimation('idle'));
      // Wrapped in setState so the widget knows the animation is ready to play
      setState(() => myArtboard = artboard);
    } else {
      throw PlatformException(code: "rive asset loading problem");
    }
  }

  /// Toggle animation playback and button states
  void _togglePlayback() =>
      // SimpleAnimation has an isActive flag that can be used to start and
      // stop/pause the animation's playback
      setState(() => _animation.isActive = _playing = !_playing);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          // ignore: avoid_redundant_argument_values
          flex: 1,
          // ignore: unnecessary_null_comparison
          child: myArtboard != null ? Rive(artboard: myArtboard) : Container(),
        ),
        Flexible(
          // ignore: avoid_redundant_argument_values
          flex: 1,
          child: ElevatedButton(
            onPressed: _togglePlayback,
            child: Text(_playing ? 'Stop' : 'Start'),
          ),
        ),
      ],
    );
  }
}
