import 'package:flutter/material.dart';

import '../party_creation_screens/party_creation_screen_title.dart';
import '../party_creation_screens/party_creation_screen_details.dart';
import '../party_creation_screens/party_creation_screen_specifics.dart';
import '../../../constants.dart';
import '../../../models/party.dart';
import '../../../widgets/purple_button.dart';

class PartyCreationScreensManager extends StatefulWidget {
  PartyCreationScreensManager({Key key}) : super(key: key);

  @override
  _PartyCreationScreensManagerState createState() =>
      _PartyCreationScreensManagerState();
}

enum CreationScreen {
  Title,
  Specifics,
  Detail,
}

class _PartyCreationScreensManagerState
    extends State<PartyCreationScreensManager> {
  CreationScreen _currentScreen = CreationScreen.Title;

  Map<String, dynamic> _newParty = {
    'timeOfTheParty': null,
    'address': '',
    'drinks': Drinks.BringYourOwnBooze,
    'imageUrl': '',
    'numberOfPeopleComming': '',
    'music': Music.House,
    'description': '',
    'title': '',
    'partyCreatorUsername': '',
    'partyCreatorImageUrl': '',
    'likes': '',
    'createdAt': '',
    'coordinates': '',
    'partyCreatorId': '',
  };

  void _changeScreen(CreationScreen screenToChangeTo) {
    setState(() {
      _currentScreen = screenToChangeTo;
    });
  }

  Widget _buildCurrentScreen() {
    if (_currentScreen == CreationScreen.Title) {
      return PartyCreationScreenTitle(
        initialValue: _newParty['title'],
        onNext: (titlePictureData) {
          _newParty['title'] = titlePictureData['title'] ?? '';
          _newParty['imageUrl'] = titlePictureData['imageUrl'] ?? '';
          _changeScreen(
              CreationScreen.values.elementAt(_currentScreen.index + 1));
        },
      );
    } else if (_currentScreen == CreationScreen.Specifics) {
      return PartyCreationScreenSpecifics(
        onNext: (specificsData) {
          _changeScreen(
              CreationScreen.values.elementAt(_currentScreen.index + 1));
        },
        onPrevious: () {
          _changeScreen(
              CreationScreen.values.elementAt(_currentScreen.index - 1));
        },
      );
    } else {
      return PartyCreationScreenDetails();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('TITLE:         ' + _newParty['title']);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _buildCurrentScreen(),

        //   bottom: 40,
        //   left: _media.size.width / 4.6,
        // ),
      ),
    );
  }
}
