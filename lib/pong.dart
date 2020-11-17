import 'package:flutter/material.dart';
import 'package:flutter_app_ancient_pong/ball.dart';
import 'package:flutter_app_ancient_pong/bat.dart';

class Pong extends StatefulWidget {
  @override
  _PongState createState() => _PongState();
}

double width;
double height;
double posX = 0;
double posY = 0;
double batWidth = 0;
double batHeight = 0;
double batPosition = 0;
double ballDiameter = 0;

class _PongState extends State<Pong> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Stack(
        children: <Widget>[
          Positioned(
            child: Ball(ballDiam: 20.0),
            top: 0.0,
          ),
          Positioned(
            child: Bat(bathHeight: 20.0, batLength: 200,),
            bottom: 0.0,
          ),
        ],
      );
    });
  }
}
