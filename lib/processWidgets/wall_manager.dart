import 'package:LetsParty/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/party_navigation_bar.dart';
import '../screens/navigation_screens/news_feed.dart';

import 'package:provider/provider.dart';

class WallManager extends StatelessWidget {
  const WallManager({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: PartyNavigationBar(
        screens: [
          NewsFeed(),
          NewsFeed(),
          NewsFeed(),
          NewsFeed(),
        ],
        onIndexChanged: (currentIndex) => print('index: $currentIndex'),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key key}) : super(key: key);

  Size _size = Size(double.infinity, 80);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    final _appBarHeight = _media.height / 11;
    _size = Size(_media.width, _appBarHeight);

    final TextStyle _style =
        Theme.of(context).textTheme.headline1.copyWith(color: Colors.white70);

    return Container(
      width: preferredSize.width,
      height: preferredSize.height,
      color: Constants.kDarkGeneralColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, _appBarHeight * 0.4, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Parties in your city',
              style: _style,
            ),
            Icon(
              Icons.more_vert,
              size: _appBarHeight * 0.5,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(
        double.infinity,
        _size.height,
      );
}
