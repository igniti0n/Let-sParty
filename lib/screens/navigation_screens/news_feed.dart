import 'package:LetsParty/widgets/party_post.dart';
import 'package:flutter/material.dart';

import '../../models/party.dart';
import '../../models/user.dart';

import 'package:provider/provider.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Party> _parties =
        Provider.of<List<Party>>(context, listen: false);
    return _parties == null || _parties.isEmpty
        ? Container(
            child: Center(
              child: Text(
                'No parties to show',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ) // Constants.displayLoadingSpinner()
        : ListView.builder(
            itemCount: _parties.length,
            itemBuilder: (BuildContext ctx, int index) {
              return PartyPost(
                party: _parties[_parties.length - 1 - index],
                currentUser: Provider.of<User>(context, listen: false),
              );
            },
          );
  }
}
