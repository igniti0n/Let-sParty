import 'package:LetsParty/constants.dart';
import 'package:flutter/material.dart';

import '../screens/navigation_screens/user_wall.dart';
import '../screens/navigation_screens/party_creation_screen.dart';
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
          PartyCreationScreen(),
          UserWall(),
          NewsFeed(),
        ],
        onIndexChanged: (currentIndex) async {
          if (currentIndex == 1) {
            return await showDialog(
                context: context,
                barrierDismissible: false,
                // barrierColor: Colors.blue[50],
                builder: (ctx) {
                  return AlertDialog(
                    content: Text('Your party setting wont be saved.'),
                    title: Text('Warning !'),
                    actions: [
                      FlatButton.icon(
                          onPressed: () => Navigator.of(ctx).pop(true),
                          icon: Icon(Icons.delete),
                          label: Text('delete')),
                      FlatButton.icon(
                          onPressed: () => Navigator.of(ctx).pop(false),
                          icon: Icon(Icons.arrow_back),
                          label: Text('keep'))
                    ],
                  );
                });
          }
          print('index: $currentIndex');
          return true;
        },
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key key}) : super(key: key);

  Size _size = Size(double.infinity, 80);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);
    final _appBarHeight =
        (_media.size.height / 11) + _media.viewPadding.top * 0.6;
    _size = Size(_media.size.width, _appBarHeight);

    final TextStyle _style =
        Theme.of(context).textTheme.headline1.copyWith(color: Colors.white70);

    return Container(
      alignment: Alignment.bottomCenter,
      width: preferredSize.width,
      height: preferredSize.height,
      color: Constants.kDarkGeneralColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            20, (_appBarHeight - _media.viewPadding.top) * 0.4, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Parties in your city',
              style: _style,
            ),
            Icon(
              Icons.more_vert,
              size: (_appBarHeight - _media.viewPadding.top * 0.6) * 0.5,
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
