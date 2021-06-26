// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_one/app/screens/widgets/social_media_icon_btn.dart';
import 'package:portfolio_one/app/shared/globals.dart';

class HomeMobile extends StatefulWidget {
  @override
  _HomeMobileState createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    // ignore: sized_box_for_whitespace
    return Container(
      height: height,
      width: width,
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            right: -width * 0.3,
            child: Opacity(
              opacity: 0.7,
              child: Image.asset('assets/1.png', height: height * 0.65),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(width * 0.07, height * 0.12, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "HEY THERE! ",
                      style: GoogleFonts.montserrat(
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w200,),
                    ),
                    Image.asset(
                      "assets/hi.gif",
                      height: height * 0.03,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "Muhammad",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.055,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 1.1,),
                ),
                Text(
                  "Hamza",
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.055, fontWeight: FontWeight.w500,),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: kPrimaryColor,
                    ),
                    // ignore: deprecated_member_use
                    TyperAnimatedTextKit(
                        // ignore: avoid_redundant_argument_values
                        isRepeatingAnimation: true,
                        speed: const Duration(milliseconds: 50),
                        textStyle: GoogleFonts.montserrat(
                            fontSize: height * 0.03,
                            fontWeight: FontWeight.w200,),
                        // ignore: prefer_const_literals_to_create_immutables
                        text: [
                          " Flutter Developer",
                          " Technical Writer",
                          " UI/UX Enthusiast",
                        ],),
                  ],
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < kSocialIcons.length; i++)
                      SocialMediaIconBtn(
                        icon: kSocialIcons[i],
                        socialLink: kSocialLinks[i],
                        height: height * 0.03,
                        horizontalPadding: 2.0,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
