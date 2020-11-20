import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/party.dart';

class PartyPost extends StatelessWidget {
  final Party party;
  const PartyPost({Key key, @required this.party}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _postSize = _size.height / 1.3;

    return Container(
      width: double.infinity,
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
                      party.partyCreatorImageUrl,
                    ),
                  ),
                ),
                Text(
                  '${party.partyCreatorUsername} is organising and event',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: _postSize * 0.40,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.network(party.imageUrl),
            ),
          ),
          Container(
            height: _postSize * 0.50,
            width: double.infinity,
            // color: Colors.blue,
          )
        ],
      ),
    );
  }

  // return Container(
  //   width: double.infinity,
  //   decoration: BoxDecoration(
  //       color: Colors.amber[400],
  //       border: Border(bottom: BorderSide(width: 1))),
  //   height: _size.height / 1.5,
  //   child: null,
  // );

}
