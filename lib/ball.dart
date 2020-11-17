import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  final double ballDiam;
  Ball({this.ballDiam});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ballDiam,
      height: ballDiam,
      decoration: BoxDecoration(
        color: Colors.amber[400],
        shape: BoxShape.circle,
      ),
    );
  }
}
