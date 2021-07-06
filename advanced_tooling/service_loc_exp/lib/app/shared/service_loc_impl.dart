// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Adopting stuff and ideas from the GetIt adn Getx package(plugin)s




import 'package:service_loc_exp/app/shared/service_loc.dart';

typedef InstanceBuilderCallback<S> = S Function(ServiceLocator);
typedef InstanceBuilderCallback1<S, A> = S Function(ServiceLocator, A);

