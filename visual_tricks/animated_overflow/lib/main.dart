// Original code by Cosmos Software | Ali Yigit Bireroglu and under MIT license.
//
// Modifications under BSD-clause-2 license by Fredrick Allan Grott 2021                                                                                                          

import 'package:animated_overflow/app/animated_overflow.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Overflow Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Animated Overflow Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF29292A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B1D1E),
        title: Text(widget.title!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints.expand(height: 20.0),
          ),
          Center(
            child: AnimatedOverflow(
              animatedOverflowDirection: AnimatedOverflowDirection.horizontal,
              maxWidth: _width / 2.0,
              padding: 40.0,
              // ignore: avoid_redundant_argument_values
              speed: 50.0,
              child: const Text(
                "The quick brown fox jumps over the lazy dog.",
                style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(height: 20.0),
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.horizontal,
            maxWidth: _width / 2.0 * 3.0,
            padding: 60.0,
            speed: 100.0,
            
            child: const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.horizontal,
            maxWidth: _width / 2.0 * 3.0,
            padding: 60.0,
            // ignore: avoid_redundant_argument_values
            speed: 50.0,
            child: const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(height: 20.0),
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.vertical,
            maxHeight: 200,
            padding: 20.0,
            speed: 150.0,
            child: FlutterLogo(
              size: _width,
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(height: 20.0),
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.horizontal,
            maxWidth: _width,
            padding: 80.0,
            speed: 200.0,
            child: const Text(
              "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
              style: TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.horizontal,
            maxWidth: _width,
            padding: 80.0,
            speed: 150.0,
            child: const Text(
              "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
              style: TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ),
          Row(
            children: [
              AnimatedOverflow(
                animatedOverflowDirection: AnimatedOverflowDirection.vertical,
                maxHeight: 100,
                padding: 20.0,
                // ignore: avoid_redundant_argument_values
                speed: 50.0,
                child: FlutterLogo(
                  size: _width / 2.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: avoid_redundant_argument_values
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedOverflow(
                    animatedOverflowDirection: AnimatedOverflowDirection.vertical,
                    maxHeight: 50,
                    padding: 20.0,
                    speed: 200.0,
                    child: FlutterLogo(
                      size: _width / 2.0,
                    ),
                  ),
                  AnimatedOverflow(
                    animatedOverflowDirection: AnimatedOverflowDirection.horizontal,
                    maxWidth: _width / 2.0,
                    padding: 20.0,
                    speed: 200.0,
                    
                    child: const FlutterLogo(
                      size: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.horizontal,
            maxWidth: _width,
            padding: 10.0,
            // ignore: avoid_redundant_argument_values
            speed: 50.0,
            child: const Text(
              "Cosmos Software",
              style: TextStyle(color: Colors.white, fontSize: 75, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.horizontal,
            maxWidth: _width,
            // ignore: avoid_redundant_argument_values
            padding: 0.0,
            // ignore: avoid_redundant_argument_values
            speed: 50.0,
            child: Container(
              width: _width * 2.0,
              height: 200.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/panoramic.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
