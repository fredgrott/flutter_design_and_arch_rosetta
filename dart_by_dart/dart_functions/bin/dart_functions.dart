// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

void main(List<String> arguments) {
  showOutput(square(2));
  showOutput(square(2.5));

  dynamic squareSquare(var number) => number * number;

  var list = ['apples', 'bananas', 'oranges'];
  list.forEach((item) {
    print('${list.indexOf(item)}: $item');
  });



}

void showOutput(var msg) {
  print(msg);
}

dynamic square(var number) {
  return number * number;
}
