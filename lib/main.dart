// @dart=2.9
import 'package:films/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new HomeScreen(),
      title: new Text('Movies App', textScaleFactor: 2,
        style: TextStyle(color: Colors.black),),
      loadingText: new Text('MOVIES', textScaleFactor: 2,
        style: TextStyle(color: Colors.black),),
      //  loaderColor: Colors.blue,
    );
  }
}