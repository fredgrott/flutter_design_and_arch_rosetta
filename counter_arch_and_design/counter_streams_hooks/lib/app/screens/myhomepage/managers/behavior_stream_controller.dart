// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rxdart/rxdart.dart';

BehaviorSubject<T> useBehaviorStreamController<T>(
    {bool sync = false,
    required VoidCallback onListen,
    required VoidCallback onCancel,
    // ignore: prefer-trailing-comma
    required List<Object> keys}) {
  return use(_BehaviorStreamControllerHook(
    onCancel: onCancel,
    onListen: onListen,
    sync: sync,
    keys: keys,
  ));
}

class _BehaviorStreamControllerHook<T> extends Hook<BehaviorSubject<T>> {
  const _BehaviorStreamControllerHook(
      // ignore: prefer-trailing-comma
      {this.sync = false, required this.onListen, required this.onCancel, required List<Object> keys})
      : super(keys: keys);

  final bool sync;
  final VoidCallback onListen;
  final VoidCallback onCancel;

  @override
  _BehaviorStreamControllerHookState<T> createState() =>
      _BehaviorStreamControllerHookState<T>();
}

class _BehaviorStreamControllerHookState<T>
    extends HookState<BehaviorSubject<T>, _BehaviorStreamControllerHook<T>> {
  late BehaviorSubject<T> _controller;

  @override
  void initHook() {
    super.initHook();
    _controller = BehaviorSubject<T>(
      sync: hook.sync,
      onCancel: hook.onCancel,
      onListen: hook.onListen,
    );
  }

  @override
  void didUpdateHook(_BehaviorStreamControllerHook<T> oldHook) {
    super.didUpdateHook(oldHook);
    if (oldHook.onListen != hook.onListen) {
      _controller.onListen = hook.onListen;
    }
    if (oldHook.onCancel != hook.onCancel) {
      _controller.onCancel = hook.onCancel;
    }
  }

  @override
  BehaviorSubject<T> build(BuildContext context) {
    return _controller;
  }

  @override
  void dispose() {
    _controller.close();
  }

  @override
  String get debugLabel => 'useBehaviorStreamController';
}