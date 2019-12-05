import 'package:flutter/material.dart';
import 'package:scancode/layouts/codescan.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(
    MaterialApp(
      home: SplashLayout(),
    )
);

class SplashLayout extends StatefulWidget {
  @override
  _SplashLayoutState createState() => _SplashLayoutState();
}

class _SplashLayoutState extends State<SplashLayout> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Scancode(),
      title: Text("Code Scanner",
        style: TextStyle(fontSize: 30.0),),
      image: new Image.asset('images/imageSplash.jpg'),
      backgroundColor: Colors.white,
      photoSize: 100.0,
    );
  }
}
