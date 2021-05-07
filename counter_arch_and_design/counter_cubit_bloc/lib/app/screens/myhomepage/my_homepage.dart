// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.




import 'package:counter_cubit_bloc/app/screens/myhomepage/statecontroller/counter_bloc.dart';
import 'package:counter_cubit_bloc/app/screens/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget{

  const MyHomePage({Key? key, required this.title, this.message = ""}) : super(key: key);

  final String title;
  final String message ;


  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(title, key: titleKey,)),
      body: BlocBuilder<CounterBloc, int>(
        builder: (_, count) {
          return Center(
            //child: Text('$count', style: Theme.of(context).textTheme.headline1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(message,key: messageKey,),
                Text('$count', style: Theme.of(context).textTheme.headline1),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterEvent.increment),
              child: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterEvent.decrement),
              child: const Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
              child: const Icon(Icons.brightness_6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterEvent.error),
              child: const Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }


}