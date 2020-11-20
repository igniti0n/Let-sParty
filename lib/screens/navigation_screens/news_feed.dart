import 'package:LetsParty/constants.dart';
import 'package:LetsParty/widgets/party_post.dart';
import 'package:flutter/material.dart';

import '../../models/party.dart';

import 'package:provider/provider.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Party> _parties =
        Provider.of<List<Party>>(context, listen: false);
    return _parties == null
        ? Constants.displayLoadingSpinner()
        : ListView.builder(
            itemCount: _parties.length,
            itemBuilder: (BuildContext ctx, int index) {
              return PartyPost(party: _parties[index]);
            },
          );
  }
}
