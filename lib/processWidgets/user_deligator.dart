import 'package:LetsParty/constants.dart';
import 'package:flutter/material.dart';

import '../screens/auth_screens/auth_signup_continue_screen.dart';
import '../services/FirebaseFirestoreService.dart';
import '../processWidgets/party_delegator.dart';
import '../models/user.dart';

import 'package:provider/provider.dart';

class UserDeligator extends StatelessWidget {
  final String uid;
  const UserDeligator({Key key, this.uid}) : super(key: key);
  static const routeName = '/userDeligator';

  @override
  Widget build(BuildContext context) {
    print('::::USER DELIGATOR::::');
    return StreamBuilder<Map<String, dynamic>>(
        stream: Provider.of<FirebaseFirestoreService>(context, listen: false)
            .getUserDataStream(uid),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState != ConnectionState.active)
            return Constants.displayLoadingSpinner();
          final User _currentUser = User.fromMap(snapshot.data, uid);
          print(uid);
          print(_currentUser?.username);
          print(_currentUser?.friends);
          print("Friend requests: ${_currentUser?.friendRequests}");
          print("Friens: ${_currentUser?.friends}");

          if (snapshot.hasData) {
            print("::::DATA FROM USER FROM FIRESTORE: ${snapshot.data}");
            return Provider.value(
              value: _currentUser,
              builder: (ctx, _) {
                return const PartyDelegator();
              },
            );
          } else {
            return SignupScreen(
              uid: uid,
            );
          }
        });
  }
}
