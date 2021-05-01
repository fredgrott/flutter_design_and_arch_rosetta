// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.



import "add_button_test.dart" as addbutton;
import "app_bar_test.dart" as appbar;
import "my_home_page_test.dart" as myhomepage;



// Not able to set a test config file so I just set that up
// in main instead to run multiple tests so that the same setup can be
// executed via android studio or via cmd-line in vscode

void main() {
  addbutton.main();
  appbar.main();
  myhomepage.main();
}
