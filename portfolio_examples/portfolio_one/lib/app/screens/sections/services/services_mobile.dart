// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_one/app/screens/widgets/service_card.dart';
import 'package:portfolio_one/app/shared/globals.dart';

class ServiceMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    
    // ignore: avoid_unnecessary_containers
    return Container(
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
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w200),
          ),
          CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ServiceCard(
                cardWidth: width < 650 ? width * 0.8 : width * 0.5,
                serviceIcon: kServicesIcons[i],
                serviceTitle: kServicesTitles[i],
                serviceDescription: kServicesDescriptions[i],
                serviceLink: kServicesLinks[i], cardHeight: 600,
              ),
            ),
            options: CarouselOptions(
                height: height * 0.45,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
                // ignore: avoid_redundant_argument_values
                autoPlayCurve: Curves.fastOutSlowIn,
                // ignore: avoid_redundant_argument_values
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enableInfiniteScroll: false,),
          ),
        ],
      ),
    );
  }
}
