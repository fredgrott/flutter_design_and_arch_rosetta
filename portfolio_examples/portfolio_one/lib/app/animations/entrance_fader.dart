// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';


class EntranceFader extends StatefulWidget {

  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset offset;

  const EntranceFader({
    required this.child,
    // ignore: avoid_redundant_argument_values
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 400),
    this.offset = const Offset(0.0, 32.0),
  });

  @override
  EntranceFaderState createState() {
    return EntranceFaderState();
  }

  

}

class EntranceFaderState extends State<EntranceFader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _dxAnimation;
  late Animation _dyAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _dxAnimation =
        Tween(begin: widget.offset.dx, end: 0.0).animate(_controller);
    _dyAnimation =
        Tween(begin: widget.offset.dy, end: 0.0).animate(_controller);
    Future.delayed(widget.delay, () {
      // ignore: unnecessary_this
      if (this.mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Opacity(
        opacity: _controller.value,
        child: Transform.translate(
          offset: Offset( _dxAnimation.value as double, _dyAnimation.value as double),
          child: widget.child,
        ),
      ),
    );
  }
}
