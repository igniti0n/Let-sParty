import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:clip_shadow/clip_shadow.dart';

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
        clipBehavior: Clip.none,
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

class PurpleButtonCliped extends StatelessWidget {
  const PurpleButtonCliped({
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
      child: Stack(
        children: [
          ClipShadow(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                color: Colors.black,
                blurRadius: 1,
              )
            ],
            clipper: ButtonClipper(),
            child: Container(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              padding: EdgeInsets.all(12),
              width: _media.size.width / 2,
              decoration: BoxDecoration(
                color: onTap == null ? Colors.grey : Constants.kButtonColor,
                border:
                    Border.all(color: Color.fromRGBO(97, 92, 92, 1), width: 4),
                //borderRadius: BorderRadius.circular(15),
                // boxShadow: [
                //   BoxShadow(offset: Offset(0, 1), color: Colors.black, blurRadius: 1)
                // ],
              ),
              child: Text(
                text,
                style: _theme.textTheme.headline1
                    .copyWith(color: Color.fromRGBO(68, 42, 42, 1)),
              ),
            ),
          ),
          CustomPaint(
            painter: BorderPainter(Size(_media.size.width / 2, 27)),
            child: Text(
              text,
              style: _theme.textTheme.headline1
                  .copyWith(color: Color.fromRGBO(68, 42, 42, 1)),
            ),
          ),
        ],
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  final Size sizeReal;
  BorderPainter(this.sizeReal);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Color.fromRGBO(97, 92, 92, 1);

    final _path = new Path();

    _path.lineTo(0, 0);
    _path.lineTo(sizeReal.width - 10, 0);
    _path.lineTo(sizeReal.width - 40, sizeReal.height);
    _path.lineTo(0, sizeReal.height);
    _path.lineTo(0, 0);

    _path.close();

    canvas.drawPath(_path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class ButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    final _path = new Path();

    _path.lineTo(0, 0);
    _path.lineTo(size.width - 10, 0);
    _path.lineTo(size.width - 40, size.height);
    _path.lineTo(0, size.height);
    _path.lineTo(0, 0);

    _path.close();

    return _path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
