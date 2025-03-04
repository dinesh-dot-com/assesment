import 'package:flutter/material.dart';

class GreenScoreIndicator extends StatelessWidget {
  final double greenScore;

  GreenScoreIndicator({required this.greenScore});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Green Score'),
        Text(
          '${greenScore.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
