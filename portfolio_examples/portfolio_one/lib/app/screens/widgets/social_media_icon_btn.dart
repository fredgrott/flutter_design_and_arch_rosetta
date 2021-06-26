// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_one/app/shared/globals.dart';

class SocialMediaIconBtn extends StatelessWidget {
  final String icon;
  final String socialLink;
  final double height;
  final double horizontalPadding;

  const SocialMediaIconBtn(
      {required this.icon, required this.socialLink, required this.height, required this.horizontalPadding,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: IconButton(
        icon: Image.network(
          icon,
        ),
        iconSize: height,
        onPressed: () => launchURL(socialLink),
        hoverColor: kPrimaryColor,
      ),
    );
  }
}