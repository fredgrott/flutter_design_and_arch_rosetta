// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// Original borrowed from rive_loader

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';
import 'package:rive_utilities/rive_controller_luke.dart';

// It's an important enough pattern of integrating
// loading an animation, using futures, and other
// patterns.
//
// Note: I have not figured out the dilemmas of how to
// do multiple atomic rive animations.An example is an
// app bar or tool-bar. It might be that I have to do
// do multiple animations on one artboard to make feasible.
//
// A possible workaround to use multiple artboards is talked
// about in this issue# https://github.com/rive-app/rive-android/issues/10
// So I could probably group animations like:
// - entry and exit to each screen on one art board as pairs
// - each additional step in Ui transition should be its own artboard.
// This way we delay having to access multiple artboards until the
// rive player on android has that feature.

class RiveLoaderLuke extends StatefulWidget {
  final String name;

  final Function(dynamic data) onSuccess;
  final Function(dynamic error, dynamic stacktrace) onError;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Alignment alignment;
  final Future Function()? until;
  final bool? isLoading;
  final String animationName;

  const RiveLoaderLuke({
    Key? key,
    required this.name,
    required this.onError,
    required this.onSuccess,
    required this.animationName,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.until,
    this.isLoading,
  }) : super(key: key);

  @override
  RiveLoaderLukeState createState() => RiveLoaderLukeState();
}

class RiveLoaderLukeState extends State<RiveLoaderLuke> {
  late RiveControllerLuke _controller;
  Artboard? _riveArtboard;
  dynamic _data; //save data from the future for the callback
  dynamic _error; //save error from the future for the callback
  dynamic _stack; //save stack from the future for the callback
  bool _isSuccessful = false;

  @override
  void initState() {
    super.initState();
    _processCallback();
    rootBundle.load(widget.name).then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        // Add a controller to play back a known animation on the main/default
        // artboard.We store a reference to it so we can toggle playback.
        _controller = RiveControllerLuke(
          widget.animationName,
          () {
            if ( _isSuccessful) {
              _finished();
            } 
          },
        );
        artboard.addController(_controller);
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Align(
        alignment: widget.alignment,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: _riveArtboard == null
              ? Container()
              : Rive(
                  artboard: _riveArtboard!,
                  fit: widget.fit,
                ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(RiveLoaderLuke oldWidget) {
    if (widget.isLoading != null && widget.isLoading != oldWidget.isLoading) {
      setState(() {
        _controller.isLoading = widget.isLoading;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  Future _processCallback() async {
    if (widget.until == null) {
      _isSuccessful = true; //based on boolean field we're always successful
    } else {
      try {
        _data = await widget.until!();
        _isSuccessful = true;
      } catch (err, stack) {
        _error = err;
        _stack = stack;
        _isSuccessful = false;
      }
      setState(() {
        _controller.isLoading = false;
      });
      if (_controller.isCompleted) {
        _finished();
      }
    }
  }

  dynamic _finished() {
    if (!_controller.isLoading!) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        if (_isSuccessful) {
          widget.onSuccess(_data);
        } else {
          widget.onError(_error, _stack);
        }
      });
    }
  }
}
