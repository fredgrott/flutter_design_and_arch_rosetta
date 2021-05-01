// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_mvp_plain/app/shared/i_model.dart';

abstract class AbstractModel implements IModel {
  late String _tag;

  String get tag => _tag;

  AbstractModel() {
    _tag = '${DateTime.now().millisecondsSinceEpoch}';
  }
}
