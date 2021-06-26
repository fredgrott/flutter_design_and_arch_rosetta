// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_one/app/screens/widgets/tool_tech_widget.dart';
import 'package:portfolio_one/app/shared/globals.dart';

class ToolsTech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Technologies I have worked with:\n"),
        Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < kTools.length; i++)
                    ToolTechWidget(
                      techName: kTools[i], key:const Key("tech"),
                    ),
                  for (int i = 0; i < kTools1.length; i++)
                    (width >= 600 && width <= 950)
                        ? ToolTechWidget(
                            techName: kTools1[i], key:const Key("tech"),
                          )
                        : Container(),
                ],
              ),
              if (width <= 600 || width >= 950) SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ) else const SizedBox(),
              if (width <= 600 || width >= 950) Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < kTools1.length; i++)
                          ToolTechWidget(
                            techName: kTools1[i], key: const Key("tech"),
                          ),
                      ],
                    ) else Container(),
            ],),
      ],
    );
  }
}

