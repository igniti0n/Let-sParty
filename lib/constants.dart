import 'package:flutter/material.dart';

class Constants {
  static const kDartkColor = Color.fromRGBO(255, 255, 255, 0.85);
  static const kAuthTextColor = Color.fromRGBO(117, 107, 107, 1);
  static const kAuthBoxColor = Color.fromRGBO(243, 241, 241, 1);

  static List<Widget> buildBackground() {
    return <Widget>[
      Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/images/pattern.png',
          fit: BoxFit.cover,
        ),
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: kDartkColor),
        child: null,
      ),
    ];
  }
}
