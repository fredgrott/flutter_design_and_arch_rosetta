// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:counter_mvp_plain/app/shared/i_model.dart';
import 'package:counter_mvp_plain/app/shared/i_presenter.dart';
import 'package:counter_mvp_plain/app/shared/i_view.dart';

abstract class AbstractPresenter<V extends IView, M extends IModel> implements IPresenter{
  late M _model;
  late V _view;

  void attachView(IView view){
    this._model= createModel() as M;
    this._view = view as V;
  }

  void dettachView(){
    if(_view!=null){
      _view = null as V;
    }
    if(_model!=null){
      _model.dispose();
      _model = null as M;
    }
  }

  V get view => _view;

  M get model => _model;



}