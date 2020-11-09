import 'package:LetsParty/services/FirebaseFirestoreService.dart';
import 'package:LetsParty/services/FirebaseStorageService.dart';
import 'package:flutter/material.dart';

import '../services/FirebaseAuthService.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:provider/provider.dart';

class AuthScreenBuilder extends StatelessWidget {
  AuthScreenBuilder({Key key, this.builderFn}) : super(key: key);
  final Widget Function(BuildContext ctx, AsyncSnapshot<auth.User> snapshot)
      builderFn;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<FirebaseAuthService>(context, listen: false)
            .userSnapshot,
        builder: (ctx, userSnapshot) {
          final user = userSnapshot.data;
          if (user != null) {
            return MultiProvider(
              providers: [
                Provider<FirebaseFirestoreService>(
                  create: (ctx) => FirebaseFirestoreService(),
                ),
                Provider<FirebaseStorageService>(
                  create: (ctx) => FirebaseStorageService(),
                ),
              ],
              //TODO: NEED TO PROVIDE.value of a USER AS A DATA MODEL AFTER MAKING PROVIDER FOR FIRESOTE AND STORAGE AVAILABLE
              child: builderFn(ctx, userSnapshot),
            );
          } else {
            return builderFn(ctx, userSnapshot);
          }
        });
  }
}
