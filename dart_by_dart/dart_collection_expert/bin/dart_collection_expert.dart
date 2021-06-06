// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

void main(List<String> arguments) {
  // Here is a simple Dart set, created using a set literal:  
  // ignore: unused_local_variable
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  // ignore: unused_local_variable
  var names = <String>{};
  // Set<String> names = {}; // This works, too.
  // var names = {}; // Creates a map, not a set.

  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);



}
