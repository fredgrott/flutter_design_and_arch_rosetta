// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

void main(List<String> arguments) {
  var n = Num();
  int number;

  number = n?.num; // null aware
  print(number);

  var nn = NumNum();
  int numberNumber;
  
  numberNumber = nn?.num ?? 18; // default value
  print(numberNumber);

  

}

// ignore: always_declare_return_types
Num() {
  return 1;
}

class NumNum {
  int num = 10;
}
