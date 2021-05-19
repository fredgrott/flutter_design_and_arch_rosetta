// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:rive/rive.dart';

class PongAnimation extends SimpleAnimation {
  PongAnimation(String animationName) : super(animationName){
    instance!.animation.loop = Loop.pingPong;
  }

  

  
  

  
}