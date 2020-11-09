import 'package:flutter/material.dart';

import '../constants.dart';

class AuthWhiteInputField extends StatelessWidget {
  final void Function(String text) onSaved;
  final double width;
  final String Function(String text) validate;
  final String hintText;
  final FocusNode focusNode;
  final bool password;
  const AuthWhiteInputField(
      {Key key,
      this.onSaved,
      this.validate,
      this.hintText,
      this.focusNode,
      this.width = 200,
      this.password = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 22),
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Constants.kAuthBoxColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: TextFormField(
        validator: validate,
        onSaved: onSaved,
        focusNode: focusNode,
        obscureText: password,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(2),
        ),
      ),
    );
  }
}
