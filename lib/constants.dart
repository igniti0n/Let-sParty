import 'package:flutter/material.dart';

class Constants {
  static const kDartkColor = Color.fromRGBO(255, 255, 255, 0.85);
  static const kButtonColor = Color.fromRGBO(145, 145, 255, 1);
  static const kButtonBorderColor = Color.fromRGBO(68, 56, 56, 1);
  static const kAuthTextColor = Color.fromRGBO(117, 107, 107, 1);
  static const kAuthBoxColor = Color.fromRGBO(243, 241, 241, 1);
  static const kDarkGeneralColor = Color.fromRGBO(42, 31, 31, 1);

  static void displaySnackbar(BuildContext ctx, String message) {
    Scaffold.of(ctx).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  static Widget displayLoadingSpinner() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

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
