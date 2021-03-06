import 'package:flutter/material.dart';

class cardChild extends StatelessWidget {
  cardChild(this.icon, this.text);
  late IconData icon;
  late String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(text, style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)))
      ],
    );
  }
}
