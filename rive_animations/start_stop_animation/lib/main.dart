import 'package:asset_cache/asset_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

final byteAssets = ByteDataAssetCache(basePath: 'assets/');

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Start and Stop a Looping Animation',
      home: Scaffold(
        body: Center(
          child: MyAnimation(),
        ),
      ),
    );
  }
}

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  // The artboard we'll use to play an animation
  late Artboard _artboard;
  late SimpleAnimation _animation;
  var _playing = true;
  String riveFileName = 'off_road_car_0_6.riv';

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  
  Future _loadRiveFile() async {
    // Load your Rive data
    final data = await byteAssets.load(riveFileName);
    // Create a RiveFile from the binary data
    RiveFile file;
    if (data.buffer.lengthInBytes.isFinite) {
      file = RiveFile.import(data);
      final Artboard artboard = file.mainArtboard;

      // Create a SimpleAnimation controller for the animation you want to play
      // and attach it to the artboard. Keep a reference to the controller to
      // start and stop it.
      artboard.addController(_animation = SimpleAnimation('idle'));
      // Wrapped in setState so the widget knows the animation is ready to play
      setState(() => _artboard = artboard);
    } else {
      throw PlatformException(code: "rive asset loading problem");
    }
  }

  /// Toggle animation playback and button states
  void _togglePlayback() =>
      // SimpleAnimation has an isActive flag that can be used to start and
      // stop/pause the animation's playback
      setState(() => _animation.isActive = _playing = !_playing);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          // ignore: avoid_redundant_argument_values
          flex: 1,
          // ignore: unnecessary_null_comparison
          child: _artboard != null ? Rive(artboard: _artboard) : Container(),
        ),
        Flexible(
          // ignore: avoid_redundant_argument_values
          flex: 1,
          child: ElevatedButton(
            onPressed: _togglePlayback,
            child: Text(_playing ? 'Stop' : 'Start'),
          ),
        ),
      ],
    );
  }
}
