// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_mvp_plain/app/shared/i_presenter.dart';
import 'package:counter_mvp_plain/app/shared/i_view.dart';
import 'package:flutter/cupertino.dart';

abstract class AbstractView extends StatefulWidget {}

abstract class AbstractViewState<T extends IPresenter<dynamic>,
    V extends AbstractView> extends State<V> implements IView {
  late T presenter;

  @override
  void initState() {
    super.initState();
    presenter = createPresenter();
    // presenter is auto not null here
    presenter.attachView(this);
  }

  T createPresenter();

  T getPresenter() {
    return presenter;
  }

  @override
  void dispose() {
    super.dispose();
    // presenter is already non null here by default to null safety
    presenter.detachView();
    // ignore: cast_nullable_to_non_nullable
    presenter = null as T;
  }
}
