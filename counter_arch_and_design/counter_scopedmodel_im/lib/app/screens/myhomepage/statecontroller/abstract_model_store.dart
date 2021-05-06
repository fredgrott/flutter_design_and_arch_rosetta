// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:scoped_model/scoped_model.dart';

abstract class AbstractModelStore extends Model {
  int get counter;
  void increment();
}
