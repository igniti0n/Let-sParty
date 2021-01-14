import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../../constants.dart';

class UserAddingScreen extends StatelessWidget {
  const UserAddingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    final ThemeData _theme = Theme.of(context);
    final MediaQueryData _mediaData = MediaQuery.of(context);

    void _tryToAddUser() {
      if (_formKey.currentState.validate()) {
        print(_formKey.currentContext.widget.toStringDeep());

        _formKey.currentState.save();
      }
    }

    return Stack(
      children: [
        ...Constants.buildBackground(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
              child: Text(
                Constants.textUserAddingScreen,
                style: _theme.textTheme.bodyText1.copyWith(
                  color: Constants.kHelperTextColor,
                ),
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  maxLines: 1,
                  toolbarOptions: ToolbarOptions(
                    copy: true,
                    cut: true,
                    paste: true,
                    selectAll: true,
                  ),
                  style: _theme.textTheme.headline1,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Divider(
              height: 2,
              thickness: 1,
              endIndent: _mediaData.size.width > 800 ? 100 : 60,
              color: Colors.blueGrey.shade300,
              indent: _mediaData.size.width > 800 ? 100 : 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: _mediaData.size.width * 0.4,
                decoration: BoxDecoration(
                  color: Constants.kButtonColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                      color: Color.fromRGBO(97, 92, 92, 1), width: 2),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black,
                        blurRadius: 1)
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Send Request',
                        textAlign: TextAlign.center,
                        style: _theme.textTheme.headline1.copyWith(
                          color: Constants.kPurpleButtonTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
