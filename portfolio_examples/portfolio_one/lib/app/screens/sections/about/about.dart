// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/widgets.dart';
import 'package:portfolio_one/app/screens/sections/about/aboutdesktop.dart';
import 'package:portfolio_one/app/screens/sections/about/aboutmobile.dart';
import 'package:portfolio_one/app/screens/sections/about/abouttab.dart';
import 'package:responsive_builder/responsive_builder.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AboutMobile(),
      tablet: AboutTab(),
      desktop: AboutDesktop(),
    );
  }
}
