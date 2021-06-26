// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_one/app/shared/globals.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String projectIcon;
  final IconData projectIconData;
  final String projectTitle;
  final String projectDescription;
  final String projectLink;
  final double cardWidth;
  final double cardHeight;
  final String backImage;
  final Widget bottomWidget;

  const ProjectCard(
      {required Key key,
      required this.backImage,
      required this.bottomWidget,
      required this.projectIcon,
      required this.projectTitle,
      required this.projectDescription,
      required this.projectLink,
      required this.projectIconData,
      required this.cardWidth,
      required this.cardHeight,})
      : super(key: key);
  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    
    return InkWell(
      onTap: () => launch(widget.projectLink),
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: Container(
        width: widget.cardWidth,
        height: widget.cardHeight,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      color: kPrimaryColor.withAlpha(200),
                      blurRadius: 12.0,
                      offset: const Offset(2.0, 3.0),
                    ),
                  ]
                : [],),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: unnecessary_null_comparison
                if (widget.projectIcon != null) Image.asset(
                        widget.projectIcon,
                        height: height * 0.1,
                      ) else Container(),
                // ignore: unnecessary_null_comparison
                if (widget.projectIconData != null) Icon(
                        widget.projectIconData,
                        color: kPrimaryColor,
                        size: height * 0.1,
                      ) else Container(),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  widget.projectTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: height * 0.02,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  widget.projectDescription,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.015,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w100,
                      height: width >= 600 ? 2.0 : 1.5,),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                //widget.bottomWidget,
              ],
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isHover ? 0.0 : 1.0,
              child: FittedBox(
                fit: BoxFit.fill,
                // ignore: unnecessary_null_comparison
                child: widget.backImage != null
                    ? Image.asset(widget.backImage)
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
