import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Animation _opaqueAnimation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 1),
    );
    _controller.forward();

    _opaqueAnimation = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(new CurvedAnimation(
        curve: new Interval(0.250, 0.750), parent: _controller));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => new Opacity(
            opacity: _opaqueAnimation.value,
            child: new Stack(children: [
              new Positioned(
                top: 30.0,
                right: 10.0,
                child: new CircleAvatar(
                  radius: 10.0,
                  child: new Text('1'),
                ),
              ),
            ]),
          ),
    );

    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 2));

    overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overlay Example"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showOverlay(context);
          },
          child: Text(
            "Show My Icon",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.green,
        ),
      ),
    );
  }
}
