// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_one/app/shared/globals.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceCard extends StatefulWidget {
  final String serviceIcon;
  final String serviceTitle;
  final String serviceDescription;
  final String serviceLink;
  final double cardWidth;
  final double cardHeight;

  const ServiceCard(
      {required this.serviceIcon,
      required this.serviceTitle,
      required this.serviceDescription,
      required this.serviceLink,
      required this.cardHeight,
      required this.cardWidth,});

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    
    return InkWell(
      onTap: () => launch(widget.serviceLink),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.serviceIcon,
              height: height * 0.1,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              widget.serviceTitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: height * 0.02,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Expanded(
              child: Text(
                widget.serviceDescription,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: height * 0.015,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w100,
                    height: width < 900 ? 2.3 : 1.5,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
