import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mixing Animations',
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
  late SimpleAnimation _bounceAnimation, _wipersAnimation;
  String riveFileName = 'assets/off_road_car_0_6.riv';

  // State of play of the bounce and wipe animations
  bool _bouncing = false;
  bool _wiping = false;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  Future _loadRiveFile() async {
    // Load your Rive data
    final data = await rootBundle.load(riveFileName);
    // Create a RiveFile from the binary data
    RiveFile file;
    if (data.buffer.lengthInBytes.isFinite) {
      file = RiveFile.import(data);
      final Artboard artboard = file.mainArtboard;

      // Create a SimpleAnimation controller for each animation
      artboard.addController(SimpleAnimation('idle'));
      artboard.addController(_bounceAnimation = SimpleAnimation('bouncing'));
      artboard.addController(
        _wipersAnimation = SimpleAnimation('windshield_wipers'),
      );

      // We're going to play the idle animation continuously and mix in the
      // others when buttons are pressed.
      _bounceAnimation.isActive = _bouncing;
      _wipersAnimation.isActive = _wiping;

      // Wrapped in setState so the widget knows the artboard is ready to play
      setState(() => _artboard = artboard);
    } else {
      throw PlatformException(code: "rive asset loading problem");
    }
  }

  /// Toggle mixing the bounce animation
  void _toggleBounce() =>
      // SimpleAnimation has an isActive flag that can be used to start and
      // stop/pause the animation's playback
      setState(() => _bounceAnimation.isActive = _bouncing = !_bouncing);

  /// Toggle mixing the bounce animation
  void _toggleWipe() =>
      // SimpleAnimation has an isActive flag that can be used to start and
      // stop/pause the animation's playback
      setState(() => _wipersAnimation.isActive = _wiping = !_wiping);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 3,
          // ignore: unnecessary_null_comparison
          child: _artboard != null ? Rive(artboard: _artboard) : Container(),
        ),
        Flexible(
          // ignore: avoid_redundant_argument_values
          flex: 1,
          child: ElevatedButton(
            onPressed: _toggleBounce,
            child: Text(_bouncing ? 'Stop Bounce' : 'Start Bounce'),
          ),
        ),
        Flexible(
          // ignore: avoid_redundant_argument_values
          flex: 1,
          child: ElevatedButton(
            onPressed: _toggleWipe,
            child: Text(_wiping ? 'Stop Wipe' : 'Start Wipe'),
          ),
        ),
      ],
    );
  }
}
