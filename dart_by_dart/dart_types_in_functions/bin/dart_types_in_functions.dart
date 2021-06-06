// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

void main(List<String> arguments) {
  print(square(5));
  print(doubleSquare(5.5));

  print(dynamicSquare(5));
  print(dynamicSquare(5.5));

}

int square(int n) {
  return n * n;
}

double doubleSquare(double d) {
  return d * d;
}

dynamic dynamicSquare(dynamic val) {
  return val * val;
}
