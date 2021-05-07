// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_redux/app/shared/app_globals.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:counter_redux/app/screens/myhomepage/statecontroller/actions.dart' as myactions;

class MyApp extends StatelessWidget {
  final Store<int> store;
  final String title;

  final String message;

  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');

  const MyApp(
      {Key? key, required this.store, required this.title, this.message = "",})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.light(),
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              title,
              key: titleKey,
            ),
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                StoreConnector<int, String>(
                  converter: (store) => store.state.toString(),
                  builder: (context, count) {
                    return Text(
                      '$myHomepageMessage $count',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                ),
              ],),),
          floatingActionButton: StoreConnector<int, VoidCallback>(
            converter: (store) {
              // Return a `VoidCallback`, which is a fancy name for a function
              // with no parameters and no return value.
              // It only dispatches an Increment action.
              return () => store.dispatch(myactions.Actions.increment);
            },
            builder: (context, callback) {
              return FloatingActionButton(
                // Attach the `callback` to the `onPressed` attribute
                onPressed: callback,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              );
            },
          ),
        ),
      ),
    );
  }
}
