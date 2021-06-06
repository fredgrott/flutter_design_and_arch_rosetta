// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

void main(List<String> arguments) {
  // ignore: omit_local_variable_types
  List names = ['Jack', 'Jill'];
  print(names.length);
  for (var n in names) {
    print(n);
  }

  // ignore: omit_local_variable_types
  List <int> ages = [18, 20, 33];
  for (var a in ages) {
    print(a);
  }

  // ignore: unused_local_variable
  var constantList = const [1, 2, 3];
  // constantList[1] = 1; // Uncommenting this causes an error.


}
