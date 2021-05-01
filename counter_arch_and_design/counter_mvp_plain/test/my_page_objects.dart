// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:counter_mvp_plain/app/modules/my_app.dart';
import 'package:counter_mvp_plain/app/screens/myhomepage/managers/my_home_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:page_object/page_object.dart';

// Page Objects so that we can craft matchers to
// grab screen(page) objects. If we have more than one screen, then
// more screen page objects will be here.
class MyAppPageObject extends PageObject {
  MyAppPageObject() : super(find.byType(MyApp));

  MyHomePageObject get home => MyHomePageObject(this);
}

class MyHomePageObject extends PageObject {
  MyHomePageObject(Finder finder)
      : super(find.descendant(of: finder, matching: find.byType(MyHomePage)));

  Finder get title =>
      find.descendant(of: this, matching: find.byKey(MyHomePage.titleKey));

  Finder get message =>
      find.descendant(of: this, matching: find.byKey(MyHomePage.messageKey));
}