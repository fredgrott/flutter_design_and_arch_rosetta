// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class RiveControllerDarthVader extends RiveAnimationController<RuntimeArtboard> {
  LinearAnimationInstance? _instance;

  final VoidCallback onFinished;
  late final String animationName;
  Loop ourLoop = Loop.oneShot;
  bool _stopOnNextApply = false;
  late double _mix;
  bool? _isLoading = true;
  

  // ignore: no-empty-block
  RiveControllerDarthVader(this.animationName,  this.onFinished,
      {double mix = 1,})
      : _mix = mix.clamp(0, 1);

  LinearAnimationInstance? get instance => _instance;
  bool isCompleted = false;

  // ignore: no-empty-block
  double get mix => _mix;

  set mix(double value) => _mix = value.clamp(0, 1).toDouble();

  @override
  bool init(RuntimeArtboard artboard) {
    _instance = artboard.animationByName(animationName);
    isActive = true;

    return _instance != null;
  }

  @override
  void apply(RuntimeArtboard artboard, double elapsedSeconds) {
    if (_stopOnNextApply || _instance == null) {
      isActive = false;
    }

    // We apply before advancing. So we want to stop rendering only once the
    // last advanced frame has been applied. This means tracking when the last
    // frame is advanced, ensuring the next apply happens, and then finally
    // stopping playback. We do this by tracking _stopOnNextApply making sure to
    // reset it when the controller is re-activated. Fixes #28 and should help
    // with issues #51 and #56.
    _instance!.animation
        .apply(_instance!.time, coreContext: artboard, mix: mix);
    _instance!.animation.loop = ourLoop;
    if (!_instance!.advance(elapsedSeconds)) {
      _stopOnNextApply = true;
    }
  }

  bool? get isLoading => _isLoading;

  set isLoading(bool? value) {
    _isLoading = value;
    if (_isLoading!) {
       
      isCompleted = false;
      isActive = true;
    }
  }
}