// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_one/app/screens/widgets/project_card.dart';
import 'package:portfolio_one/app/shared/globals.dart';

class ContactMobileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          Text(
            "\nContact",
            style: GoogleFonts.montserrat(
              fontSize: height * 0.06,
              fontWeight: FontWeight.w100,
              letterSpacing: 1.0,
            ),
          ),
          Text(
            "Let's get in touch and build something together :)\n\n",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w200),
            textAlign: TextAlign.center,
          ),
          
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ProjectCard(
                cardWidth: width > 480 ? width * 0.5 : width * 0.8,
                projectIconData: kContactIcons[i],
                projectTitle: kContactTitles[i],
                projectDescription: kContactDetails[i], backImage: '', bottomWidget: const SizedBox(), cardHeight: 400, key: const Key("card"), projectIcon: '', projectLink: '',
              ),
            ),
            options: CarouselOptions(
                height: height * 0.3,
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