// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:looping_animation/app/shared/app_globals.dart';
import 'package:rive/rive.dart';

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  // The artboard we'll use to play one of its animations
  
  

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  
  Future _loadRiveFile() async {
    // Load your Rive data
    
    // Create a RiveFile from the binary data
    RiveFile file;
    bytes = await byteAssets.load(riveFileName);
    if (bytes.buffer.lengthInBytes.isFinite) {
      file = RiveFile.import(bytes);
      final Artboard artboard = file.mainArtboard;

      // Create a SimpleAnimation controller for the animation you want to play
      // and attach it to the artboard
      artboard.addController(SimpleAnimation('idle'));
      // Wrapped in setState so the widget knows the animation is ready to play
      setState(() => myArtboard = artboard);
    } else {
      throw PlatformException(code: "rive asset loading problem");
    }
  }

  @override
  Widget build(BuildContext context) =>
      // ignore: unnecessary_null_comparison
      myArtboard != null ? Rive(artboard: myArtboard) : Container();
}
