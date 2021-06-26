// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_one/app/screens/sections/navbar/navbar_logo.dart';
import 'package:portfolio_one/app/screens/widgets/about_me_text.dart';
import 'package:portfolio_one/app/screens/widgets/community_icon_btn.dart';
import 'package:portfolio_one/app/screens/widgets/tools_tech.dart';
import 'package:portfolio_one/app/shared/globals.dart';

class AboutMobile extends StatelessWidget {
  final _communityLogoHeight = [50.0, 60.0, 30.0];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02,),
      color: Colors.grey[900],
      child: Column(
        children: [
          Text(
            "About Me",
            style: GoogleFonts.montserrat(
              fontSize: height * 0.06,
              fontWeight: FontWeight.w100,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          const AboutMeText(
            textAlign: TextAlign.center,
            fontSize: 13, key: Key("aboutme"),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < kCommunityLogo.length; i++)
                CommunityIconBtn(
                  icon: kCommunityLogo[i],
                  link: kCommunityLinks[i],
                  height: _communityLogoHeight[i], key: const Key("icon"),
                ),
            ],
          ),
          SizedBox(
            height: height * 0.025,
          ),
          ToolsTech(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NavBarLogo(
                height: height * 0.04,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
