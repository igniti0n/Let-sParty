import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/auth_white_input_field.dart';

class AuthLoginScreen extends StatefulWidget {
  AuthLoginScreen({Key key}) : super(key: key);

  @override
  _AuthLoginScreenState createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    print('::: BUILDIN AUTH LOGIN SCREEN :::');
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    // final queryData = MediaQuery.of(context);
    // final deviceWidth = queryData.size.width;
    // final deviceHeight = queryData.size.height - queryData.viewPadding.vertical;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ...Constants.buildBackground(),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AuthWhiteInputField(
                          hintText: '  email..',
                        ),
                        AuthWhiteInputField(
                          hintText: '  password..',
                        ),
                        if (!_isLogin)
                          AuthWhiteInputField(
                            hintText: '  confirm..',
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _isLogin ? 40 : 20,
                  ),
                  AuthButton(
                    width: 150,
                    height: 50,
                    onPressed: () {},
                    text: _isLogin ? 'Let\'s party' : 'Continue',
                  ),
                  AuthButton(
                    width: 150,
                    height: 50,
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    text: _isLogin ? 'Signup ?' : 'Login ?',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
