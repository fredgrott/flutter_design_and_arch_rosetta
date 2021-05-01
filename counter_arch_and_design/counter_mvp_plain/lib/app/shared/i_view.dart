// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

abstract class IView {
  void startLoading();

  void showLoadSuccess();

  void showLowFailure(int code, String message);

  void showEmptyData();

  void startSubmit(String message);

  void showSubmitSuccess();

  void showSubmitFailure(int code, String message);
}
