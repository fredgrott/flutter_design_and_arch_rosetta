import 'package:asset_cache/asset_cache.dart';
import 'package:custom_controller/app/screens/myapp/my_app.dart';
import 'package:flutter/material.dart';



final byteAssets = ByteDataAssetCache(basePath: 'assets/');

void main() => runApp(MyApp());

// A simple [RiveAnimationController] the can be started and paused; when
// paused the animation continues to play until it reaches the end of its
// animation loop.

