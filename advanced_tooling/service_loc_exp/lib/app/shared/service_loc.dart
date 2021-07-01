// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// A service lookup class which allows factories of instances and singletons
import 'package:logging/logging.dart';
import 'package:service_loc_exp/app/shared/service_loc_impl.dart';

/// to be registered and resolved as part of a dependency injection system.
class ServiceLocator {
  final Map<String, InstanceBuilderCallback> _factories = {};
  final Map<String, dynamic> _factories1 = <String, dynamic>{};
  final Map<String, InstanceBuilderCallback> _singletonFactories = {};
  final Map<String, dynamic> _singletons = <String, dynamic>{};
  Logger logger = Logger('DI');

  /// Shared container where all instances are registered to. A new container
  /// may be assigned to the `sharedContainer` for testing purposes.
  static ServiceLocator sharedContainer = ServiceLocator.newContainer();

  factory ServiceLocator() => sharedContainer;

  ServiceLocator.newContainer();

  /// Registers a  factory closure. A new instance will be created every time it
  /// is resolved.
  void registerFactory<T>(InstanceBuilderCallback<T> function) {
    logger.info('Registered $T.toString() as a factory');
    _factories[T.toString()] = function;
  }

  /// Registers a  factory closure with one argument. A new instance will be
  /// created every time it is resolved.
  void registerFactory1<T, A>(InstanceBuilderCallback1<T, A> function) {
    logger.info(
      'Registered $T.toString() as a factory1 with a $A.toString() argument',
    );
    _factories1[T.toString()] = function;
  }

  /// Registers a singleton factory closure. The instance will only be created
  /// once resolved.
  /// Arguments are not supported for singleton registration.
  void registerSingleton<T>(InstanceBuilderCallback<T> function) {
    logger.info('Registered $T.toString() as a Singleton');
    _singletonFactories[T.toString()] = function;
  }

  /// Calls `resolve` under the hood. This method does not support arguments.
  T call<T>() => resolve();

  /// For singleton registration, it returns a previously created singleton
  /// instance if already created, otherwise creates a new instance and caches
  /// it. For regular factory, it returns a new instance value every time.
  T resolve<T>() {
    final name = T.toString();

    if (_singletons.containsKey(name)) {
      logger.info('Resolved $name as a Singleton');

      return _singletons[name] as T;
    }

    if (_singletonFactories.containsKey(name)) {
      logger.info('Created and Resolved $name as a Singleton');
      final instance = _singletonFactories[name]!(ServiceLocator()) as T;
      _singletons[name] = instance;
      _singletonFactories.remove(name);

      return instance;
    }

    if (_factories[name] != null) {
      logger.info('Resolved $name as a factory');

      return _factories[name]!(ServiceLocator()) as T;
    }

    throw Exception("Instance hasn't been registered!");
  }

  /// Returns a newly created instance injecting one argument.
  T resolve1<T, A>(A arg1) {
    final name = T.toString();

    if (_factories1[name] != null) {
      logger.info('Resolved $name as a factory1');

      return _factories1[name](ServiceLocator(), arg1) as T;
    }

    throw Exception("Instance hasn't been registered with an argument!");
  }
}
