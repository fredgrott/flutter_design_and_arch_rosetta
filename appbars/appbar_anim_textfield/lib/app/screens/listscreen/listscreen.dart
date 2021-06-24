// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'dart:async';

import 'package:appbar_anim_textfield/app/shared/globals.dart';
import 'package:appbar_anim_textfield/app/widgets/appbar_textfield.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Contact> _allContacts = <Contact>[];
  final StreamController<List<Contact>> _contactStream =
      StreamController<List<Contact>>();

  @override
  void initState() {
    _allContacts = List.generate(1000, (i) {
      return Contact(
        faker.person.name(),
        faker.date.dateTime(),
      );
    });

    _contactStream.add(_allContacts);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTextField(
          title: const Text("Contacts"),
          onBackPressed: _onRestoreAllData,
          onClearPressed: _onRestoreAllData,
          onChanged: _onSearchChanged,
        ),
        body: _buildBody(),);
  }

  void _onSearchChanged(String value) {
    final List<Contact> foundContacts = _allContacts
        .where((Contact contact) =>
            contact.name.toLowerCase().contains(value.toLowerCase()))
        .toList();

    // ignore: unnecessary_this
    this._contactStream.add(foundContacts);
  }

  void _onRestoreAllData() {
    // ignore: unnecessary_this
    this._contactStream.add(this._allContacts);
  }

  Widget _buildBody() {
    return StreamBuilder<List<Contact>>(
        stream: _contactStream.stream,
        builder: (context, snapshot) {
          final List<Contact> contacts = snapshot.hasData ? snapshot.data! : [];

          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];

              return ListTile(
                leading: const CircleAvatar(),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        contact.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                        "${contact.date.day.toString()}/${contact.date.month.toString()}/${contact.date.year.toString()}",
                        style: const TextStyle(color: Colors.grey),),
                  ],
                ),
                subtitle: Text(faker.job.title()),
              );
            },
          );
        },);
  }

  @override
  void dispose() {
    _contactStream.close();
    super.dispose();
  }
}
