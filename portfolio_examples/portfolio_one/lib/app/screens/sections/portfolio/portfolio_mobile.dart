// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_one/app/screens/widgets/project_card.dart';
import 'package:portfolio_one/app/shared/globals.dart';

class PortfolioMobileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          Text(
            "\nPortfolio",
            style: GoogleFonts.montserrat(
              fontSize: height * 0.06,
              fontWeight: FontWeight.w100,
              letterSpacing: 1.0,
            ),
          ),
          Text(
            "Here are few samples of my previous work :)\n\n",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w200),
            textAlign: TextAlign.center,
          ),
          CarouselSlider.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ProjectCard(
                cardWidth: width < 650 ? width * 0.8 : width * 0.4,
                projectIcon: kProjectsIcons[i],
                projectTitle: kProjectsTitles[i],
                projectDescription: kProjectsDescriptions[i],
                // use Sizedbox as placeholder according to https://stackoverflow.com/questions/57703182/flutter-container-vs-sizedbox-for-dummy-empty#57703904
                projectLink: kProjectsLinks[i], backImage: '', cardHeight: 400, key: const Key("card"), projectIconData:Icons.portrait_outlined, bottomWidget: const SizedBox(),
              ),
            ),
            options: CarouselOptions(
                height: height * 0.4,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
                // ignore: avoid_redundant_argument_values
                autoPlayCurve: Curves.fastOutSlowIn,
                // ignore: avoid_redundant_argument_values
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enableInfiniteScroll: false,),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          MaterialButton(
            hoverColor: kPrimaryColor.withAlpha(150),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: kPrimaryColor),),
            onPressed: () {
              launchURL("https://github.com/fredgrott");
            },
            child: Text(
              "See More",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
