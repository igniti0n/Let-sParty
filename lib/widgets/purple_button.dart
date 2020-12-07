import 'package:flutter/material.dart';

import '../constants.dart';

class PurpleButton extends StatelessWidget {
  const PurpleButton({
    Key key,
    @required MediaQueryData media,
    @required ThemeData theme,
    @required this.onTap,
    @required this.text,
  })  : _media = media,
        _theme = theme,
        super(key: key);

  final MediaQueryData _media;
  final ThemeData _theme;
  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        width: _media.size.width / 1.7,
        decoration: BoxDecoration(
          color: onTap == null ? Colors.grey : Constants.kButtonColor,
          border: Border.all(color: Color.fromRGBO(97, 92, 92, 1), width: 2),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(offset: Offset(0, 1), color: Colors.black, blurRadius: 1)
          ],
        ),
        child: Text(
          text,
          style: _theme.textTheme.headline1
              .copyWith(color: Color.fromRGBO(68, 42, 42, 1)),
        ),
      ),
    );
  }
}
