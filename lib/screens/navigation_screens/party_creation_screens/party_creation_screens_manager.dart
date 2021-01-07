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
    'music': Music.House,
    'description': '',
    'title': '',
    'partyCreatorUsername': '',
    'partyCreatorImageUrl': '',
    'likes': '',
    'createdAt': '',
    'coordinates': null,
    'partyCreatorId': '',
    'slogan': '',
  };

  DateTime _datePicked = null;
  TimeOfDay _timePicked = null;

  void _changeScreen(CreationScreen screenToChangeTo) {
    setState(() {
      _currentScreen = screenToChangeTo;
    });
  }

  Future<bool> _tryToAddParty() async {
    return false;
  }

  void _saveSpecifics(Map<String, dynamic> specificsData) {
    if (specificsData['address'] != '')
      _newParty['address'] = specificsData['address'];
    if (specificsData['coordinates'] != null)
      _newParty['coordinates'] = specificsData['coordinates'];

    if (specificsData['time'] != null) _timePicked = specificsData['time'];
    if (specificsData['date'] != '')
      _datePicked = DateTime.parse(specificsData['date']);

    _newParty['drinks'] = specificsData['drinks'];
    _newParty['music'] = specificsData['music'];
  }

  void _saveDescription(String slog, String desc) {
    _newParty['slogan'] = slog;
    _newParty['description'] = desc;
  }

  Widget _buildCurrentScreen() {
    if (_currentScreen == CreationScreen.Title) {
      return PartyCreationScreenTitle(
        initialValueText: _newParty['title'],
        initialValuePicture: _newParty['imageUrl'],
        onNext: (titlePictureData) {
          if (titlePictureData['title'] != '')
            _newParty['title'] = titlePictureData['title'];
          if (titlePictureData['imageUrl'] != '')
            _newParty['imageUrl'] = titlePictureData['imageUrl'];
          _changeScreen(
              CreationScreen.values.elementAt(_currentScreen.index + 1));
        },
      );
    } else if (_currentScreen == CreationScreen.Specifics) {
      return PartyCreationScreenSpecifics(
        initialData: {
          'address': _newParty['address'],
          'drinks': _newParty['drinks'],
          'music': _newParty['music'],
          'date': _datePicked?.toIso8601String() ?? '',
          'time': _timePicked,
          'coordinates':
              _newParty['coordinates'], //LatLng(latitude: 20, longitude: 20),
        },
        onNext: (specificsData) {
          _saveSpecifics(specificsData);
          _changeScreen(
              CreationScreen.values.elementAt(_currentScreen.index + 1));
        },
        onPrevious: (specificsData) {
          _saveSpecifics(specificsData);
          _changeScreen(
              CreationScreen.values.elementAt(_currentScreen.index - 1));
        },
      );
    } else {
      return PartyCreationScreenDetails(
        descriptionInitialValue: _newParty['description'],
        sloganInitialValue: _newParty['slogan'],
        onNext: (slogan, description) {
          _saveDescription(slogan, description);
          _tryToAddParty().then((isSuccess) {
            if (isSuccess) Navigator.of(context).pop();
          });
        },
        onPrevious: (slogan, description) {
          _saveDescription(slogan, description);
          _changeScreen(
              CreationScreen.values.elementAt(_currentScreen.index - 1));
        },
      );
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
