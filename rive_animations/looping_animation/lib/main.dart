import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Looping Animation',
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
  // The artboard we'll use to play one of its animations
  late Artboard _artboard;
  String riveFileName = 'assets/off_road_car_0_6.riv';

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

      // Create a SimpleAnimation controller for the animation you want to play
      // and attach it to the artboard
      artboard.addController(SimpleAnimation('idle'));
      // Wrapped in setState so the widget knows the animation is ready to play
      setState(() => _artboard = artboard);
    } else {
      throw PlatformException(code: "rive asset loading problem");
    }
  }

  @override
  Widget build(BuildContext context) =>
      // ignore: unnecessary_null_comparison
      _artboard != null ? Rive(artboard: _artboard) : Container();
}
