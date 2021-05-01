// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// The gist is that we should be unit testing our model
// for correct implied contractual behavior. Thus, we need the
// increaseCounter hook that our State-Container uses. This also
// ensures that we are testing in two places; both the model and 
// it's implied contract and the view behavior where state changes 
// integrate with model changes.
class CounterMixin {
  static const int _counter = 0;

  int myCounter = _counter;

  int increaseCounter() {
    return myCounter++;
  }
}
