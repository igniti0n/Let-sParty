import 'package:flutter/material.dart';

import '../../models/dummy_parties.dart';
import '../../models/party.dart';
import '../../services/FirebaseFirestoreService.dart';
import 'package:provider/provider.dart';

class UserWall extends StatefulWidget {
  const UserWall({Key key}) : super(key: key);

  @override
  _UserWallState createState() => _UserWallState();
}

class _UserWallState extends State<UserWall> {
  int _number = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text('number: $_number'),
            FlatButton(
              onPressed: () {
                setState(() {
                  _number++;
                });
                // DummyParties.parties.forEach((element) =>
                //     Provider.of<FirebaseFirestoreService>(context,
                //             listen: false)
                //         .storePartyInACollection(Party.toMap(element)));
              },
              child: Text('press me'),
            )
          ],
        ),
      ),
    );
  }
}
