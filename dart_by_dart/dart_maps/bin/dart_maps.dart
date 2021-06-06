// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

void main(List<String> arguments) {
  // Dart infers that gifts has the type Map<String, String> and nobleGases has the type Map<int, String>.
  // ignore: unused_local_variable
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  // ignore: unused_local_variable
  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  // You can create the same objects using a Map constructor:

  // ignore: prefer_collection_literals
  var giftsGifts = Map();
  giftsGifts['first'] = 'partridge';
  giftsGifts['second'] = 'turtledoves';
  giftsGifts['fifth'] = 'golden rings';
  
  //map literal
  var nobleGasesNobleGases = {};
  nobleGasesNobleGases[2] = 'helium';
  nobleGasesNobleGases[10] = 'neon';
  nobleGasesNobleGases[18] = 'argon';

  var giftsNo = {'first': 'partridge'};
  assert(giftsNo['fifth'] == null);

  // ignore: unused_local_variable
  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

// constantMap[2] = 'Helium'; // Uncommenting this causes an error.


}
