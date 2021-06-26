// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_one/app/shared/globals.dart';

class ToolTechWidget extends StatelessWidget {
  final String techName;

  const ToolTechWidget({ required Key key, required this.techName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: kPrimaryColor,
            size: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(" $techName"),
        ],
      ),
    );
  }
}
