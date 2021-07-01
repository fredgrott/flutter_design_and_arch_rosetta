// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.





import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:system_info/system_info.dart';

const int megaBYTE = 1024 * 1024;






Map<String, dynamic> memory = <String, dynamic>{};

Map<String, String> tags = {};

Map<String, dynamic> extra = <String, dynamic>{};


// ignore: prefer_void_to_null
Future<Null> initPlatformInfo() async {
   

  final PackageInfo info = await PackageInfo.fromPlatform();

  
    
  tags['platform'] =
        defaultTargetPlatform.toString().substring('TargetPlatform.'.length);
  tags['package_name'] = info.packageName;
  tags['build_number'] = info.buildNumber;
  tags['version'] = info.version;

  // system_info plugin has no support for web
  if(kIsWeb){
    memory['phys_total'] = 'not available';
    memory['phys_free'] = 'not available';
    memory['virt_total'] = 'not available';
    memory['virt_free'] = 'not available';
    extra['memory'] = memory;

  } else{
    memory['phys_total'] = '${SysInfo.getTotalPhysicalMemory() ~/ megaBYTE}MB';
    memory['phys_free'] = '${SysInfo.getFreePhysicalMemory() ~/ megaBYTE}MB';
    memory['virt_total'] = '${SysInfo.getTotalVirtualMemory() ~/ megaBYTE}MB';
    memory['virt_free'] = '${SysInfo.getFreeVirtualMemory() ~/ megaBYTE}MB';
    extra['memory'] = memory;

  }    

  final ConnectivityResult connectivity =
        await Connectivity().checkConnectivity();
    tags['connectivity'] =
        connectivity.toString().substring('ConnectivityResult.'.length);

}