import 'package:LetsParty/models/user.dart';
import 'package:LetsParty/screens/party_detail_screen.dart';
import 'package:LetsParty/services/FirebaseFirestoreService.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../models/party.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PartyPost extends StatefulWidget {
  final Party party;
  const PartyPost({Key key, @required this.party}) : super(key: key);

  @override
  _PartyPostState createState() => _PartyPostState();
}

class _PartyPostState extends State<PartyPost> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _postSize = _size.height / 1.265;
    final _detailSize = _postSize * 0.50;
    final _theme = Theme.of(context);

    final User _userData = Provider.of<User>(context, listen: false);

    void _goToProfile() {
      print('tapnuo');
    }

    final TapGestureRecognizer _recognizer = TapGestureRecognizer()
      ..onTap = _goToProfile;

    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      // decoration: BoxDecoration(
      //     color: Colors.amber[400],
      //     border: Border(bottom: BorderSide(width: 1))),
      height: _postSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: _postSize * 0.10,
            width: double.infinity,
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      widget.party.partyCreatorImageUrl,
                    ),
                  ),
                ),
                //style: Theme.of(context).textTheme.headline2,
                RichText(
                  text: TextSpan(
                    text: '${widget.party.partyCreatorUsername} ',
                    recognizer: _recognizer,
                    style: _theme.textTheme.bodyText1
                        .copyWith(fontWeight: FontWeight.w800),
                    children: [
                      TextSpan(
                        text: 'is organising an event',
                        style: _theme.textTheme.bodyText1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: _postSize * 0.40,
            child: FittedBox(
              fit: BoxFit.fill,
              child: !widget.party.imageUrl.startsWith('http')
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Image.network(widget.party.imageUrl),
            ),
          ),
          Container(
            height: _detailSize,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.party.title,
                        style:
                            _theme.textTheme.headline1.copyWith(fontSize: 25),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/icons/peopleComing.png',
                        height: _detailSize * 0.13,
                      ),
                      Text(
                        '${widget.party.numberOfPeopleComming} people coming',
                        style: _theme.textTheme.bodyText1,
                      ),
                      Image.asset(
                        'assets/icons/calendar.png',
                        height: _detailSize * 0.11,
                      ),
                      Text(
                        DateFormat.yMEd().format(widget.party.timeOfTheParty),
                        style: _theme.textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 18, 0, 18),
                    child: Text(
                      '"${widget.party.slogan}"',
                      textAlign: TextAlign.center,
                      style: _theme.textTheme.headline1
                          .copyWith(fontSize: 20, color: Colors.grey[900]),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Divider(
                        thickness: 1,
                        endIndent: 20,
                        color: Colors.blueGrey.shade300,
                        indent: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                              PartyDetailScreen.routeName,
                              arguments: widget.party),
                          child: Text(
                            'View Party Details',
                            style: _theme.textTheme.bodyText1
                                .copyWith(fontSize: 19),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        endIndent: 20,
                        color: Colors.blueGrey.shade300,
                        indent: 20,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (widget.party.likes.contains(_userData.uid)) {
                            //  print('YES IT COINTAINS IT');
                            widget.party.likes.remove(_userData.uid);
                          } else {
                            //  print('noooooooooooope');
                            widget.party.likes.add(_userData.uid);
                          }
                          setState(() {
                            Provider.of<FirebaseFirestoreService>(context,
                                    listen: false)
                                .updatePartyLikes(
                              widget.party.partyId,
                              widget.party.likes,
                            );
                          });

                          print(widget.party.likes);
                        },
                        child: Image.asset(
                          widget.party.likes.contains(_userData.uid)
                              ? 'assets/icons/liver-filled.png'
                              : 'assets/icons/liver-empty.png',
                          height: _detailSize * 0.13,
                        ),
                      ),
                      Container(
                        width: _size.width * 0.7,
                        height: _detailSize * 0.13,
                        child: Text(
                          widget.party.likes.contains(_userData.uid)
                              ? 'You and ${widget.party.likes.length - 1} people wreckd liver for this party !'
                              : 'Your liver is safe from this party',
                          textAlign: TextAlign.left,
                          style: _theme.textTheme.bodyText1.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      // Text(
                      //   DateFormat.yMMMd().format(widget.party.createdAt),
                      //   style: _theme.textTheme.bodyText1,
                      // )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GestureRecognizer {}
