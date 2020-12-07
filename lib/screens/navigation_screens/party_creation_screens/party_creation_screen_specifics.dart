import 'package:LetsParty/models/lat_long.dart';
import 'package:LetsParty/models/party.dart';
import 'package:flutter/material.dart';

import '../../../screens/navigation_screens/party_creation_screens/navigation_party_creation_widget.dart';
import '../../../constants.dart';

class PartyCreationScreenSpecifics extends StatelessWidget {
  PartyCreationScreenSpecifics({Key key, this.onNext, this.onPrevious})
      : super(key: key);

  final Function(Map<String, dynamic> speficisData) onNext;
  final Function() onPrevious;
  Map<String, dynamic> _specificsData = {
    'address': '',
    'drinks': Drinks.BringYourOwnBooze,
    'numberOfPeopleComming': 0,
    'music': Music.Techno,
    'coordinates': LatLng(latitude: 0, longitude: 0)
  };

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Stack(
      children: [
        ...Constants.buildBackground(),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 20, 20, 0),
                child: Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/beer.png',
                        height: 50,
                      ),
                      Container(
                        width: media.size.width / 1.5,

                        //TODO: ENFORCE TITLE LENGHT
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(fontSize: 26),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Your SPECIFIS title',
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            contentPadding: EdgeInsets.all(2),
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/icons/toast.png',
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 2,
                thickness: 1,
                endIndent: 20,
                color: Colors.blueGrey.shade300,
                indent: 20,
              ),
            ],
          ),
        ),
        NavigationPartyCreationWidget(
            media: media,
            onNext: () => onNext(_specificsData),
            onPrevious: onPrevious)
        //   bottom: 40,
        //   left: _media.size.width / 4.6,
        // ),
      ],
    );
  }
}
