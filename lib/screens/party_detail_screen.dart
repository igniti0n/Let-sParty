import 'package:LetsParty/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/party.dart';

class PartyDetailScreen extends StatelessWidget {
  static final routeName = '/partyDetailScreen';
  const PartyDetailScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);
    final double _availableHeight =
        _media.size.height - _media.viewInsets.top - _media.viewPadding.top;
    final Party _party = ModalRoute.of(context).settings.arguments as Party;
    final _theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          SingleChildScrollView(
            clipBehavior: Clip.antiAlias,
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    width: _media.size.width,
                    height: _availableHeight * 0.35,
                    child: Image.network(
                      _party.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 24, 4, 0),
                    child: Text(_party.title,
                        style:
                            _theme.textTheme.headline1.copyWith(fontSize: 25)),
                  ),
                  Divider(
                    thickness: 1,
                    endIndent: 20,
                    color: Colors.blueGrey.shade300,
                    indent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 22),
                    child: Text(
                      _party.description,
                      style: _theme.textTheme.bodyText1,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 12, 4, 0),
                    child: Text('Party Location',
                        style: _theme.textTheme.headline1.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400)),
                  ),
                  Divider(
                    thickness: 1,
                    endIndent: 20,
                    color: Colors.blueGrey.shade300,
                    indent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/location.png',
                          height: 44,
                        ),
                        Text(_party.address,
                            style: _theme.textTheme.bodyText1.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 22, 4, 0),
                    child: Text('Party Specifics',
                        style: _theme.textTheme.headline1.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400)),
                  ),
                  Divider(
                    thickness: 1,
                    endIndent: 20,
                    color: Colors.blueGrey.shade300,
                    indent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/icons/time.png',
                          height: 34,
                        ),
                        Text(
                          DateFormat.Hm().format(_party.timeOfTheParty) +
                              '      ',
                          style: _theme.textTheme.bodyText1.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Image.asset(
                          'assets/icons/calendar.png',
                          height: 34,
                        ),
                        Text(DateFormat.yMEd().format(_party.timeOfTheParty),
                            style: _theme.textTheme.bodyText1.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/icons/drinks.png',
                          height: 34,
                        ),
                        Text(
                          _party.drinks.toString().replaceRange(0, 7, ''),
                          style: _theme.textTheme.bodyText1.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Image.asset(
                          'assets/icons/music.png',
                          height: 34,
                        ),
                        Text(_party.music.toString().replaceRange(0, 6, ''),
                            style: _theme.textTheme.bodyText1.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: _availableHeight * 0.05,
            left: 10,
            child: IconButton(
              color: Colors.white,
              icon: Icon(
                Icons.arrow_back,
                size: 40,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            bottom: 26,
            left: _media.size.width / 4,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
              width: _media.size.width / 2,
              decoration: BoxDecoration(
                color: Constants.kButtonColor,
                border:
                    Border.all(color: Color.fromRGBO(97, 92, 92, 1), width: 2),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1), color: Colors.black, blurRadius: 1)
                ],
              ),
              child: Text(
                'I am coming!',
                style: _theme.textTheme.headline1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
