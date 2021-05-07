// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:math';

import 'package:counter_statesrebuilder/app/screens/myhomepage/statecontroller/counter.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title, this.message = ""}) : super(key: key);

  final String title;
  final String message ;


  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');

  @override
  // ignore: long-method
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
            ),
            //subscribe to counter injected model
            On(
              () => Text(
                '${counter.state}',
                style: Theme.of(context).textTheme.headline5,
              ),
            ).listenTo(counter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //set the value of the counter and notify observer widgets to rebuild.
          counter.setState(
            (int counter) {
              if (Random().nextBool()) {
                throw Exception('A Counter Error');
              }

              return counter + 1;
            },
            onSetState: On.or(
              onError: (dynamic error, void Function() refresh) {
                RM.navigate.toDialog<dynamic>(
                  AlertDialog(
                    content: Row(
                      children: [
                        Text('${error.message}'),

                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () {
                            refresh();
                            RM.navigate.back();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              onData: () {
                //show snackBar
                //any current snackBar is hidden.
                RM.scaffold.showSnackBar<dynamic>(
                  SnackBar(
                    content: Text('${counter.state}'),
                  ),
                );
              },
              // ignore: no-empty-block
              or: () {},
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }


}
