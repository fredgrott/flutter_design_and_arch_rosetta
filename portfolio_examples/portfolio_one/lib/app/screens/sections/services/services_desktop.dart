// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_one/app/animations/bottom_animation.dart';
import 'package:portfolio_one/app/screens/widgets/service_card.dart';
import 'package:portfolio_one/app/shared/globals.dart';

class ServiceDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02,),
      child: Column(
        children: [
          Text(
            "\nWhat I Do",
            style: GoogleFonts.montserrat(
              fontSize: height * 0.06,
              fontWeight: FontWeight.w100,
              letterSpacing: 1.0,
            ),
          ),
          Text(
            "I can help :)\n\n",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w200),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: width < 1200
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  WidgetAnimator(
                    child: ServiceCard(
                      cardWidth: width < 1200 ? width * 0.3 : width * 0.22,
                      cardHeight: width < 1200 ? height * 0.4 : height * 0.35,
                      serviceIcon: kServicesIcons[0],
                      serviceTitle: kServicesTitles[0],
                      serviceDescription: kServicesDescriptions[0],
                      serviceLink: kServicesLinks[0],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  WidgetAnimator(
                    child: ServiceCard(
                      cardWidth: width < 1200 ? width * 0.3 : width * 0.22,
                      cardHeight: width < 1200 ? height * 0.4 : height * 0.35,
                      serviceIcon: kServicesIcons[1],
                      serviceTitle: kServicesTitles[1],
                      serviceDescription: kServicesDescriptions[1],
                      serviceLink: kServicesLinks[1],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  WidgetAnimator(
                    child: ServiceCard(
                      cardWidth: width < 1200 ? width * 0.3 : width * 0.22,
                      cardHeight: width < 1200 ? height * 0.4 : height * 0.35,
                      serviceIcon: kServicesIcons[2],
                      serviceTitle: kServicesTitles[2],
                      serviceDescription: kServicesDescriptions[2],
                      serviceLink: kServicesLinks[2],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WidgetAnimator(
                    child: ServiceCard(
                      cardWidth: width < 1200 ? width * 0.3 : width * 0.22,
                      cardHeight: width < 1200 ? height * 0.4 : height * 0.35,
                      serviceIcon: kServicesIcons[3],
                      serviceTitle: kServicesTitles[3],
                      serviceDescription: kServicesDescriptions[3],
                      serviceLink: kServicesLinks[3],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  WidgetAnimator(
                    child: ServiceCard(
                      cardWidth: width < 1200 ? width * 0.3 : width * 0.22,
                      cardHeight: width < 1200 ? height * 0.4 : height * 0.35,
                      serviceIcon: kServicesIcons[4],
                      serviceTitle: kServicesTitles[4],
                      serviceDescription: kServicesDescriptions[4],
                      serviceLink: kServicesLinks[4],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
