import 'package:flutter/material.dart';

class SizeHelper {
  static MediaQueryData _query;
  static double _deviceHeight;
  static double _deviceWidth;
  static double _availableSpaceVertical;
  static double _availableSpaceHorizontal;
  static double _paddingVertical;
  static double _paddingHorizontal;

  static void init(BuildContext context) {
    _query = MediaQuery.of(context);
    _query.size.height;
    _query.size.width;
    _paddingVertical = _query.padding.top + _query.padding.bottom;
    _paddingHorizontal = _query.padding.left + _query.padding.right;
    _availableSpaceVertical = _deviceHeight - _paddingVertical;
    _availableSpaceHorizontal = _deviceWidth - _paddingHorizontal;
  }
}
