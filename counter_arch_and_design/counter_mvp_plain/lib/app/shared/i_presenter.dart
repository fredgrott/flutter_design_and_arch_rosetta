// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_mvp_plain/app/shared/i_view.dart';

abstract class IPresenter<V extends IView> {
  void attachView(V view);

  void detachView();

  void createModel();
}
