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
  /// The artboard we'll use to play an animation
  late Artboard _artboard;
  late SimpleAnimation _bounceAnimation;

  // Level of bounciness (i.e. how much of the bounce animation should be mixed
  // in) from 0 to 1
  double _bounciness = 0;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  /// Loads data from a Rive file and initializes playback
  Future _loadRiveFile() async {
    // Load your Rive data
    const String riveFileName = 'assets/off_road_car_0_6.riv';
    final data = await rootBundle.load(riveFileName);
    // Create a RiveFile from the binary data
    RiveFile file;
    if (data.buffer.lengthInBytes.isFinite) {
      file = RiveFile.import(data);

      // Get the artboard containing the animation you want to play
      final Artboard artboard = file.mainArtboard;
      // Create a SimpleAnimation controller for each animation
      artboard.addController(SimpleAnimation('idle'));
      artboard.addController(
        _bounceAnimation = SimpleAnimation('bouncing', mix: _bounciness),
      );

      // Wrapped in setState so the widget knows the artboard is ready to play
      setState(() => _artboard = artboard);
    } else {
      throw PlatformException(code: "rive asset loading problem");
    }
  }

  /// Sets the level of bounciness
  void _setBounciness(double value) {
    setState(() => _bounceAnimation.mix = _bounciness = value);
  }

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
          child: Slider(
            value: _bounciness,
            // ignore: avoid_redundant_argument_values
            min: 0,
            // ignore: avoid_redundant_argument_values
            max: 1,
            divisions: 5,
            onChanged: _setBounciness,
          ),
        ),
      ],
    );
  }
}
