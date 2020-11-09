import 'package:flutter/cupertino.dart';

import './lat_long.dart';

enum Drinks {
  BringYourOwnBooze,
  AvailableToBuy,
  FreeDrinks,
}

enum Music {
  DJ,
  Techno,
  House,
  TurboFolk,
  Clasic,
}

// THIS IS AN ADDED COMMENT

class Party {
  @required
  final DateTime timeOfTheParty;
  @required
  final String address;
  @required
  final LatLng coordinates;
  @required
  final Drinks drinks;
  @required
  final Music music;
  int numberOfPeopleComming;
  int likes;
  @required
  final DateTime createdAt;
  @required
  final String imageUrl;
  final String description;
  final String title;
  final String partyCreatorUsername;
  final String partyCreatorImageUrl;
  final String partyCreatorId;

  Party({
    this.timeOfTheParty,
    this.address,
    this.drinks,
    this.imageUrl,
    this.numberOfPeopleComming,
    this.music,
    this.description,
    this.title,
    this.partyCreatorUsername,
    this.partyCreatorImageUrl,
    this.likes = 0,
    this.createdAt,
    this.coordinates,
    this.partyCreatorId,
  });

  factory Party.fromMap(Map<String, dynamic> inputMap) {
    if (inputMap == null)
      return null;
    else {
      return new Party(
        timeOfTheParty: inputMap['timeOfTheParty'],
        address: inputMap['address'],
        drinks: inputMap['drinks'],
        music: inputMap['music'],
        numberOfPeopleComming: inputMap['numberOfPeopleComming'],
        imageUrl: inputMap['imageUrl'],
        description: inputMap['description'],
        title: inputMap['title'],
        partyCreatorUsername: inputMap['partyCreatorUsername'],
        partyCreatorImageUrl: inputMap['partyCreatorImageUrl'],
        likes: inputMap['likes'],
        createdAt: inputMap['createdAt'],
        coordinates: LatLng.fromMap(inputMap['coordinates']),
        partyCreatorId: inputMap['partyCreatorId'],
      );
    }
  }

  static Map<String, dynamic> toMap(Party party) {
    return party == null
        ? null
        : {
            'timeOfTheParty': party.timeOfTheParty,
            'address': party.address,
            'drinks': party.drinks,
            'imageUrl': party.imageUrl,
            'numberOfPeopleComming': party.numberOfPeopleComming,
            'music': party.music,
            'description': party.description,
            'title': party.title,
            'partyCreatorUsername': party.partyCreatorUsername,
            'partyCreatorImageUrl': party.partyCreatorImageUrl,
            'likes': party.likes,
            'createdAt': party.createdAt,
            'coordinates': LatLng.toMap(party.coordinates),
            'partyCreatorId': party.partyCreatorId,
          };
  }
}
