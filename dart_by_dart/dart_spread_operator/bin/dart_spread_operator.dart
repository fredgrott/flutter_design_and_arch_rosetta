// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

void main(List<String> arguments) {
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  assert(list2.length == 4);

  var list11;
  var list21 = [0, ...?list11];
  assert(list21.length == 1);


}
