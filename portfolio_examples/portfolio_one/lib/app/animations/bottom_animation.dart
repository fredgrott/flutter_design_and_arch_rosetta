// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/widgets.dart';

class Animator extends StatefulWidget {
  final Widget child;
  final Duration time;

  const Animator(this.child, this.time);

  @override
  _AnimatorState createState() => _AnimatorState();
}

class _AnimatorState extends State<Animator>
    with SingleTickerProviderStateMixin {
  late Timer timer;
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    timer = Timer(widget.time, animationController.forward);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: animation.value as double,
          child: Transform.translate(
            offset: Offset(0.0, -50 + (animation.value as double)* 50),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

late Timer timer;
Duration duration = const Duration();

Duration wait() {
  // ignore: unnecessary_null_comparison
  if (timer == null || !timer.isActive) {
    timer = Timer(const Duration(microseconds: 120), () {
      duration = const Duration();
    });
  }
  // ignore: join_return_with_assignment
  duration += const Duration(milliseconds: 300);

  return duration;
}

class WidgetAnimator extends StatelessWidget {
  final Widget child;

  const WidgetAnimator({required this.child});

  @override
  Widget build(BuildContext context) {
    return Animator(child, wait());
  }
}
