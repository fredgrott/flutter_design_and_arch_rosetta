// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// Note: Original code author is the project lead of the 
//       plugin rive_loading, Jimmy Aumard under MIT
//       license. My modifications are under the 
//       BSD-clause-2 license.

// It's an important enough pattern of integrating 
// loading an animation, using futures, and other 
// patterns.
//
// Note: I have not figured out the dilemmas of how to 
// do multiple atomic rive animations.An example is an 
// app bar or tool-bar. It might be that I have to do 
// do multiple animations on one artboard to make feasible.
//
// A possible workaround to use multiple artboards is talked 
// about in this issue# https://github.com/rive-app/rive-android/issues/10
// So I could probably group animations like:
// - entry and exit to each screen on one art board as pairs
// - each additional step in Ui transition should be its own artboard.
// This way we delay having to access multiple artboards until the 
// rive player on android has that feature.

import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class RiveController extends RiveAnimationController<RuntimeArtboard>{

  final String? _startAnimation, _loopAnimation, _endAnimation;
  final VoidCallback onFinished;
  bool isIntroFinished = false;
  bool _isLastLoadingFinished = false;
  bool? _isLoading = true;

  bool? get isLoading => _isLoading;

  set isLoading(bool? value) {
    _isLoading = value;
    if (_isLoading!) {
      _isLastLoadingFinished = false;
      isCompleted = false;
      isActive = true;
    }
  }

  bool isCompleted = false;
  LinearAnimationInstance? _start, _loading, _complete;

  RiveController(this._startAnimation, this._loopAnimation, this._endAnimation, this.onFinished);

  bool get hasStartAnimation => _startAnimation != null;

  bool get hasLoopAnimation => _loopAnimation != null;

  bool get hasEndAnimation => _endAnimation != null;

  @override
  bool init(RuntimeArtboard artboard) {
    if (_startAnimation != null) {
      // changed to firstWhere due to rive api breaking change
      final dynamic start = artboard.animations.firstWhere((dynamic a) => a.name == _startAnimation);
      if (start != null) {
        _start = LinearAnimationInstance(start as LinearAnimation);
      }
    }
    if (_loopAnimation != null) {
      final dynamic  loading = artboard.animations.firstWhere((dynamic a) => a.name == _loopAnimation);
      if (loading != null) {
        _loading = LinearAnimationInstance(loading as LinearAnimation);
      }
    }
    if (_endAnimation != null) {
      final dynamic complete = artboard.animations.firstWhere((dynamic a) => a.name == _endAnimation);
      if (complete != null) {
        _complete = LinearAnimationInstance(complete as LinearAnimation);
      }
    }
    // ignore: join_return_with_assignment
    isActive = _endAnimation != null || _loopAnimation != null || _startAnimation != null;
    return isActive;
  }
  
  @override
  void apply(RuntimeArtboard artboard, double elapsed) {
    if (!isIntroFinished && _start != null) {
      _start!.animation.loop = Loop.oneShot;
      // ignore: avoid_redundant_argument_values
      _start!.animation.apply(_start!.time, coreContext: artboard, mix: 1);
      if (_start!.advance(elapsed)) {
        // animation not finished, let's continue
        return;
      } else {
        //anim finished
        isIntroFinished = true;
        //reset animation in case it's same one as the start one
        _loading?.reset();
        if (_loading == null && _complete == null) {
          isLoading = false;
          onFinished();
          // set the controller a inactive has nothing to run anymore
          isActive = false;
          return;
        }
      }
    }
    if (isLoading! && _loading != null) {
      _loading!.animation.loop = Loop.loop;
      // Still loading...
      // ignore: avoid_redundant_argument_values
      _loading!.animation.apply(_loading!.time, coreContext: artboard, mix: 1);
      _loading!.advance(elapsed);
    } else if (_loading != null && !_isLastLoadingFinished) {
      _loading!.animation.loop = Loop.oneShot;
      // Complete, but need to finish loading animation...
      // ignore: avoid_redundant_argument_values
      _loading!.animation.apply(_loading!.time, coreContext: artboard, mix: 1);
      _isLastLoadingFinished = !_loading!.advance(elapsed);
      if (_isLastLoadingFinished) {
        //reset animation in case it's same one as the others before
        _complete?.reset();
      }
    } else if (_complete == null) {
      isLoading = false;
      onFinished();
      isActive = false;
      return; // false;
    } else if (!isCompleted) {
      _complete!.animation.loop = Loop.oneShot;
      // Chain completion animation
      // ignore: avoid_redundant_argument_values
      _complete!.animation.apply(_complete!.time, coreContext: artboard, mix: 1);
      if (!_complete!.advance(elapsed)) {
        // Notify we're done and stop advancing.
        isCompleted = true;
        isLoading = false;
        onFinished();
        isActive = false;
        return; // false;
      }
    }
  }
}