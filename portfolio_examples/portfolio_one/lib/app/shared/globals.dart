// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

double appbarHeight = 96;

String appTitle = "Fred Grott";

// Colors
Color kPrimaryColor = const Color(0xffC0392B);

// Social Media
const kSocialIcons = [
  "https://img.icons8.com/material/48/ffffff/twitter--v1.png",
  "https://img.icons8.com/material/48/ffffff/linkedin--v1.png",
  "https://img.icons8.com/material/48/ffffff/xing.png",
  "https://img.icons8.com/material/48/ffffff/keybase.png",
  "https://img.icons8.com/material-outlined/48/ffffff/github.png",
  "https://img.icons8.com/material/48/ffffff/medium-logo.png",
];

const kSocialLinks = [
  "https://twitter.com/fredgrott",
  "https://www.linkedin.com/in/fredgrottstartupfluttermobileappdesigner/",
  "https://www.xing.com/profile/Fred_Grott/cv",
  "https://xing.com",
  "https://keybase.io",
  "https://github.com/fredgrott",
  "https://fredgrott.medium.com",
];

// URL Launcher
// ignore: avoid_void_async
void launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

// Community
final kCommunityLogo = [
  'assets/cui.png',
  'assets/flutterIsl.png',
  'assets/dsc.png',
];

final kCommunityLinks = [
  "https://www.meetup.com/Flutter-Chicago/",
  
];

// Tools & Tech
final kTools = ["Flutter", "Dart", "Python", "Java", "Kotlin","Swift","C++"];

final kTools1 = ["HTML", "CSS", "Bootstrap", "Markdown", "Graphics"];

// services
final kServicesIcons = [
  "assets/services/app.png",
  "assets/services/ui.png",
  "assets/services/rapid.png",
  "assets/services/blog.png",
  "assets/services/open.png",
];

final kServicesTitles = [
  "Full App Development",
  "UI/UX Designing",
  "Rapid Prototyping",
  "Technical Blog Writing",
  "Open Source - GitHub",
];

final kServicesDescriptions = [
  "Writing about Flutter App Design and Development",
  "Developing Open Source Libraries",
  "StartUp Adventures",
];

final kServicesLinks = [
  
  "https://fredgrott.medium.com",
  "https://github.com/fredgrott",
  "https://keybase.io/fredgrott",
];

// projects
final kProjectsBanner = [
  "assets/projects/medkitB.png",
  
];

final kProjectsIcons = [
  "assets/projects/medkit.png",
  
];

final kProjectsTitles = [
  "Rosetta Stone Of Flutter Arch and Design",

];

final kProjectsDescriptions = [
  "Creating Apps and Code for Medium Articles and Flutter Book Series",
];

final kProjectsLinks = [
  "",
];

// Contact
final kContactIcons = [
  Icons.home,
  Icons.mail,
];

final kContactTitles = [
  "Location",
  "Email",
];

final kContactDetails = [
  "NW Indiana, USA",
  "fred.grott@gmail.com",
];

