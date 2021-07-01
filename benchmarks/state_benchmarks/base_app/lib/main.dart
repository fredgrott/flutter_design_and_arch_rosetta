// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:base_app/app/myapp.dart';
import 'package:flutter/material.dart';

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Idle Sample',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Page(title: 'Idle Sample'),
//     );
//   }
// }

// class Page extends StatefulWidget {
//   Page({
//     Key key,
//     this.title,
//   }) : super(key: key);

//   final String title;

//   @override
//   _PageState createState() => _PageState();
// }

// final items = List<Item>.of(sampleItems);

// class _PageState extends State<Page> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Idle"),
//       ),
//       body: ListViewWidget(),
//     );
//   }
// }

// class ListViewWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(items[index].title),
//           );
//         });
//   }
// }

void main() {
  runApp(const MyApp());
}
