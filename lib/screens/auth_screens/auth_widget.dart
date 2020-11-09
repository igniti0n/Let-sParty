import 'package:LetsParty/screens/auth_screens/auth_login_screen.dart';
import 'package:LetsParty/screens/wall_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/loading_widget.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth show User;

class AuthenticationWidget extends StatelessWidget {
  const AuthenticationWidget({Key key, this.snapshot}) : super(key: key);
  final AsyncSnapshot<auth.User> snapshot;

  @override
  Widget build(BuildContext context) {
    print('::::BUILDING AUTHENTICATION WIDGET::::');
    if (snapshot.connectionState != ConnectionState.waiting) {
      return snapshot.hasData ? WallScreen() : AuthLoginScreen();
    }
    return Scaffold(
      body: Center(
        child: LoadingWidget(),
      ),
    );
  }
}
