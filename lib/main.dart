import 'package:flutter/material.dart';

import './screens/auth_screens/auth_widget.dart';
import './services/FirebaseAuthService.dart';
import './services/ImagePickerService.dart';
import './widgets/auth_screen_builder.dart';
import './widgets/loading_widget.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(
          create: (ctx) => FirebaseAuthService(),
        ),
        Provider<ImagePickerService>(
          create: (ctx) => ImagePickerService(),
        )
      ],
      child: FutureBuilder(
          future: Firebase.initializeApp(
              // options: FirebaseOptions(
              //   apiKey: 'AIzaSyBBXGnPlC0G6iWUlqwmegOktq8mtr6oPlk',
              //   projectId: 'partyproject-93b33',
              //   appId: '1:900201121391:android:aae50ffbc3f857bd436f9a',
              //   messagingSenderId: '900201121391',
              // ),
              ),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AuthScreenBuilder(
                builderFn: (ctx, userSnapshot) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Let\'s Party',
                    theme: ThemeData(
                      primaryColor: Color.fromRGBO(42, 31, 31, 1),
                      textTheme: TextTheme(
                        headline1: TextStyle(
                            fontFamily: 'Rockwell',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        headline2: TextStyle(
                            fontFamily: 'Rockwell',
                            fontSize: 17,
                            fontWeight: FontWeight.normal),
                        bodyText1: TextStyle(
                            fontFamily: 'Rockwell',
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                        bodyText2: TextStyle(
                            fontFamily: 'Rockwell',
                            fontSize: 11,
                            fontWeight: FontWeight.normal),
                      ),
                      appBarTheme:
                          AppBarTheme(color: Color.fromRGBO(42, 31, 31, 1)),
                    ),
                    home: AuthenticationWidget(
                      snapshot: userSnapshot,
                    ),
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: Text('No data.'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
