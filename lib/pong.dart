import 'package:flutter/material.dart';
import 'package:flutter_app_ancient_pong/ball.dart';
import 'package:flutter_app_ancient_pong/bat.dart';

enum Direction{up, down, left, right}


class Pong extends StatefulWidget {
  @override
  _PongState createState() => _PongState();
}
void checkBorders(){
  if(posX <= 0 && hDir == Direction.left) {
    hDir = Direction.right;
  }
  if(posX >= width-ballDia && hDir == Direction.right){
    hDir = Direction.left;
  }
  if(posY >= height - ballDia && vDir == Direction.down){
    vDir = Direction.up;
  }
  if(posY <= 0 && vDir== Direction.up){
    vDir = Direction.down;
  }

}
Direction vDir = Direction.down;
Direction hDir = Direction.right;
Animation<double> animation;
AnimationController controller;
double width;
double height;
double posX = 0;
double posY = 0;
double batWidth = 0;
double batHeight = 0;
double batPosition = 0;
double ballDiameter = 0;
double ballDia = 20;
double increment = 5;


class _PongState extends State<Pong> with SingleTickerProviderStateMixin {

@override
  void initState() {
    posX = 0;
    posY = 0;
    controller = AnimationController(
        duration: const Duration(minutes: 10000),
        vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 100).animate(controller);
    animation.addListener((){
      setState(() {
        (hDir == Direction.right) ? posX +=increment : posX -=increment;
        (vDir == Direction.down) ? posY +=increment : posY -=increment;
        posX++;
        posY++;
      });
      checkBorders();
    });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          height = constraints.maxHeight;
          width = constraints.maxWidth;
          batWidth = width/5;
          batHeight = height/20;
      return Stack(
        children: <Widget>[
          Positioned(
            child: Ball(ballDiam: ballDia),
            top: posY,
            left: posX,
          ),
          Positioned(
            child: Bat(bathHeight: batHeight, batLength: batWidth,),
            bottom: 0.0,
          ),
        ],
      );
    });
  }
}
