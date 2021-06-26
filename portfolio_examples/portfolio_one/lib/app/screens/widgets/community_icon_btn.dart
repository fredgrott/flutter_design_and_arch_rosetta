// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_one/app/shared/globals.dart';

class CommunityIconBtn extends StatelessWidget {
  final String icon;
  final String link;
  final double height;

  // ignore: avoid_unused_constructor_parameters
  const CommunityIconBtn({required Key key, required this.icon, required this.link, required this.height});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: () => launchURL(link),
        child: Image.asset(
          icon,
          height: height,
        ),
      ),
    );
  }
}
