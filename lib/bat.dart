import 'package:flutter/material.dart';

class Bat extends StatelessWidget {
  final double batLength;
  final double bathHeight;
  Bat({this.batLength, this.bathHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: bathHeight,
      width: batLength,
    );
  }
}
