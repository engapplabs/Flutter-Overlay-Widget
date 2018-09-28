import 'package:flutter/material.dart';
import 'package:flutter_overlay_widget/src/screens/homeScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Overlay Widget',
      home: new Scaffold(
        body: new HomeScreen(),
      ),
    );
  }
}
