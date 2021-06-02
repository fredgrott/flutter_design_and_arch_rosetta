// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:portal/portal.dart';
import 'package:themes_crossplatform/app/screens/myhomepage/widgets/barrier.dart';
import 'package:themes_crossplatform/app/screens/myhomepage/widgets/hole_painter.dart';
import 'package:themes_crossplatform/app/themes/button_themes.dart';


class Discovery extends StatelessWidget {
  const Discovery({
    Key? key,
    required this.visible,
    required this.onClose,
    required this.description,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Widget description;
  final bool visible;
  final VoidCallback onClose;

  @override
  // ignore: long-method
  Widget build(BuildContext context) {
    return Barrier(
      visible: visible,
      onClose: onClose,
      child: PortalEntry(
        visible: visible,
        closeDuration: kThemeAnimationDuration,
        portalAnchor: Alignment.center,
        childAnchor: Alignment.center,
        portal: Stack(
          children: [
            CustomPaint(
              // button color during discovery highlight
              painter: HolePainter(myBackgroundElevatedButtonColor),
              child: TweenAnimationBuilder<double>(
                duration: kThemeAnimationDuration,
                curve: Curves.easeOut,
                tween: Tween(begin: 50, end: visible ? 200 : 50),
                builder: (context, radius, _) {
                  return Padding(
                    padding: EdgeInsets.all(radius),
                    child: child,
                  );
                },
              ),
            ),
            Positioned(
              top: 100,
              left: 50,
              width: 200,
              child: DefaultTextStyle(
                style: platformThemeData(
                       context,
                       // ignore: cast_nullable_to_non_nullable
                       material: (data) => data.textTheme.headline5 as TextStyle,
                       cupertino: (data) => data.textTheme.navTitleTextStyle,
                  ),
                child: TweenAnimationBuilder<double>(
                  duration: kThemeAnimationDuration,
                  curve: Curves.easeOut,
                  tween: Tween(begin: 0, end: visible ? 1 : 0),
                  builder: (context, opacity, _) {
                    return Opacity(
                      opacity: opacity,
                      child: description,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
