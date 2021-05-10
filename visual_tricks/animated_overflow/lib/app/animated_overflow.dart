// Original code by Cosmos Software | Ali Yigit Bireroglu  and under 
// MIT license.
//
// Modifications copyrighted by Fredrick Allan Grott 2021 and 
// under BSd-clause-2 license  

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimatedOverflowDirection {
  vertical,
  horizontal
}

class AnimatedOverflow extends StatefulWidget {
  ///Use this value to determine the direction of this [AnimatedOverflow].
  final AnimatedOverflowDirection? animatedOverflowDirection;

  ///The widget that is to be displayed by this [AnimatedOverflow].
  final Widget? child;

  ///The maximum height of this [AnimatedOverflow]. This value is only considered if [animatedOverflowDirection] is [AnimatedOverflowDirection.VERTICAL] and it should not be null.
  final double? maxHeight;

  ///The maximum width of this [AnimatedOverflow]. This value is only considered if [animatedOverflowDirection] is [AnimatedOverflowDirection.HORIZONTAL] and it should not be null.
  final double? maxWidth;

  ///The padding to be applied around the [child]. If [animatedOverflowDirection] is [AnimatedOverflowDirection.VERTICAL], this padding is applied around the top and the bottom of the [child]. Else, it is applied around the left and the right of the [child]. The [stops] of the [LinearGradient] are also determined by this value.
  final double padding;

  ///The speed of the animation of this [AnimatedOverflow].
  final double speed;

  const AnimatedOverflow({
    Key? key,
    this.animatedOverflowDirection,
    this.child,
    this.maxHeight,
    this.maxWidth,
    this.padding = 0.0,
    this.speed = 50,
  })  : assert(animatedOverflowDirection != null && child != null),
        assert(animatedOverflowDirection != AnimatedOverflowDirection.vertical || maxHeight != null),
        assert(animatedOverflowDirection != AnimatedOverflowDirection.horizontal || maxWidth != null),
        super(key: key);

  @override
  _AnimatedOverflowState createState() {
    return _AnimatedOverflowState();
  }
}

class _AnimatedOverflowState extends State<AnimatedOverflow> {
  GlobalKey? _globalKey;
  ScrollController? _scrollController;
  double? _maxDimension;
  late EdgeInsets _padding;
  late Size _size;
  late MultiTween _multiTween;
  DateTime? _lastFrame;
  late Duration _frameRate;
  late bool _showSelf;

  AnimatedOverflowDirection? get _animatedOverflowDirection => widget.animatedOverflowDirection;
  double get _dimensionOfInterest => _animatedOverflowDirection == AnimatedOverflowDirection.vertical ? _size.height : _size.width;
  double? get _containerWidth => _animatedOverflowDirection == AnimatedOverflowDirection.vertical ? _size.width : _maxDimension;
  double? get _containerHeight => _animatedOverflowDirection == AnimatedOverflowDirection.vertical ? _maxDimension : _size.height;
  Alignment get _gradientBegin => _animatedOverflowDirection == AnimatedOverflowDirection.vertical ? Alignment.topCenter : Alignment.centerLeft;
  Alignment get _gradientEnd => _animatedOverflowDirection == AnimatedOverflowDirection.vertical ? Alignment.bottomCenter : Alignment.centerRight;
  Axis get _scrollDirection => _animatedOverflowDirection == AnimatedOverflowDirection.vertical ? Axis.vertical : Axis.horizontal;
  bool get _shouldAnimate => _dimensionOfInterest > _maxDimension!;

  void onPostFrameCallback(Duration duration) {
    if (_lastFrame != null) {
      _frameRate = Duration(milliseconds: DateTime.now().difference(_lastFrame!).inMilliseconds);
    }
    _lastFrame = DateTime.now();
    if (!_showSelf) {
      setState(() {
        // ignore: cast_nullable_to_non_nullable
        final RenderBox _renderBox = _globalKey!.currentContext!.findRenderObject() as RenderBox;
        _size = _renderBox.size;

        if (_shouldAnimate) {
          _multiTween = MultiTween<DefaultAnimationProperties>()..add(DefaultAnimationProperties.offset, Tween<dynamic>(begin: 0.0, end: _dimensionOfInterest - _maxDimension!), Duration(seconds: (_renderBox.size.width / widget.speed).round()), Curves.easeInOut);
        }

        _showSelf = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _globalKey = GlobalKey();
    // ignore: avoid_redundant_argument_values
    _scrollController = ScrollController(initialScrollOffset: 0.0);
    _maxDimension = _animatedOverflowDirection == AnimatedOverflowDirection.vertical ? widget.maxHeight : widget.maxWidth;
    _padding = _animatedOverflowDirection == AnimatedOverflowDirection.vertical ? EdgeInsets.only(top: widget.padding, bottom: widget.padding) : EdgeInsets.only(left: widget.padding, right: widget.padding);
    _frameRate = const Duration(milliseconds: 1);
    _showSelf = false;
    WidgetsBinding.instance!.addPostFrameCallback(onPostFrameCallback);
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_showSelf) {
      if (_animatedOverflowDirection == AnimatedOverflowDirection.vertical) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              key: _globalKey,
              child: Padding(
                padding: _padding,
                child: widget.child,
              ),
            ),
          ],
        );
      } else {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              key: _globalKey,
              child: Padding(
                padding: _padding,
                child: widget.child,
              ),
            ),
          ],
        );
      }
    } else if (_shouldAnimate) {
      return CustomAnimation(
          control: CustomAnimationControl.mirror,
          tween: _multiTween,
          duration: _multiTween.duration,
          builder: (BuildContext context, Widget? myWidget, MultiTweenValues<dynamic> animation) {
            try {
              if (_scrollController!.hasClients) {
                _scrollController!.animateTo(animation.get(DefaultAnimationProperties.offset), duration: _frameRate, curve: Curves.linear);
              }
            } catch (_) {}
            // ignore: sized_box_for_whitespace
            return Container(
              width: _containerWidth,
              height: _containerHeight,
              child: ClipRect(
                child: ShaderMask(
                  shaderCallback: (Rect rect) {
                    return LinearGradient(
                      begin: _gradientBegin,
                      end: _gradientEnd,
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [Colors.transparent, Colors.black, Colors.black, Colors.black, Colors.transparent],
                      stops: [
                        0.0,
                        widget.padding / _maxDimension!,
                        0.5,
                        (_maxDimension! - widget.padding) / _maxDimension!,
                        1.0,
                      ],
                    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: CustomScrollView(
                    controller: _scrollController,
                    scrollDirection: _scrollDirection,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          key: _globalKey,
                          child: Padding(
                            padding: _padding,
                            child: widget.child,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    } else {
      return widget.child!;
    }
  }
}
