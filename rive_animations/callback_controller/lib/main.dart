

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void main() => runApp(MyApp());

/// A simple [RiveAnimationController] that runs a callback when the animation
/// has finished;
class CallbackAnimation extends SimpleAnimation {
  CallbackAnimation(
    String animationName, {
    required this.callback,
    required double mix,
  }) : super(animationName, mix: mix);

  final Function callback;

  @override
  void apply(RuntimeArtboard artboard, double elapsedSeconds) {
    // Apply the animation to the artboard with the appropriate level of mix
    instance!.animation.apply(instance!.time, coreContext: artboard, mix: mix);

    // If false, the animation has ended (it doesn't loop)
    if (!instance!.advance(elapsedSeconds)) {
      _onCompleted(callback);
    }
  }

  void _onCompleted(Function callback) {
    final start =
        instance!.animation.enableWorkArea ? instance!.animation.workStart : 0;
    final currentFrame = (instance!.time - start) * instance!.animation.fps;
    final endFrame =
        instance!.animation.enableWorkArea ? instance!.animation.workEnd : 120;

    // if the animation is within one frame to the end I'll call the callback
    if (currentFrame >= endFrame - 1) {
      isActive = false;

      // addPostFrameCallback added to avoid build collision
      WidgetsBinding.instance!.addPostFrameCallback((_) => callback());
    }
  }

  /// Resets the animation to its starting state and starts it
  void resetAndStart(RuntimeArtboard artboard) {
    
    instance!.time =
        (instance!.animation.enableWorkArea ? instance!.animation.workStart : 0)
                .toDouble() /
            instance!.animation.fps;
    isActive = true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Callback Animation',
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
  
  late CallbackAnimation _animation;
  String riveFileName = 'assets/success_check.riv';

  // Has the animation finished
  bool _isAnimationComplete = false;
  late RuntimeArtboard _artboard;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  
  // use bytes.buffer.lengthInBytes.isFinite as that returns a bool in the if condition
  Future _loadRiveFile() async {
    // Load your Rive data
    
    // waits here until completes, rest is not executed until this 
    // completes
    final ByteData bytes = await rootBundle.load(riveFileName);
    RiveFile file;
    if (bytes.buffer.lengthInBytes.isFinite){
      file = RiveFile.import(bytes);
      final Artboard artboard = file.mainArtboard;
      artboard.addController(
      _animation = CallbackAnimation(
        'Untitled',
        callback: ()=> setState(()=> _isAnimationComplete = true), mix:0,
      ),
    );
         setState(() => _artboard = artboard as RuntimeArtboard);
    } else{
      // we need to throw an error exception if it fails to load
      // and in a real app one would log it.
      throw PlatformException(code: "rive loading error");
    }
  
    
  }

  void _replay() {
    _animation.resetAndStart(_artboard);
    setState(() => _isAnimationComplete = false);
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
          child: ElevatedButton(
            onPressed: _isAnimationComplete ? _replay : null,
            child: Text(_isAnimationComplete ? 'Replay' : 'Running'),
          ),
        ),
      ],
    );
  }
}
