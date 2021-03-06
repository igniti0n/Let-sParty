import 'package:LetsParty/screens/navigation_screens/user_wall.dart';
import 'package:flutter/material.dart';

import '../widgets/user_wall_navigator.dart';
import '../models/user.dart';
import '../sizehelper.dart';

class VisitingUserScreen extends StatelessWidget {
  final User visitingUser;
  final User currentUser;
  const VisitingUserScreen({
    Key key,
    @required this.visitingUser,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SizeHelper.init(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: UserWall(
        logedInUser: currentUser,
        visitingUser: visitingUser,
      ),
    );
  }
}
