import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore instance = FirebaseFirestore.instance;

  Future<void> storeUserInACollection(
    Map<String, dynamic> dataToBeStored,
    String uid,
  ) async {
    try {
      return await instance.collection('users').doc(uid).set(dataToBeStored);
    } catch (error) {
      throw error;
    }
  }

  Future<void> storePartyInACollection(
      Map<String, dynamic> dataToBeStored) async {
    try {
      return await instance.collection('parties').add(dataToBeStored);
    } catch (error) {
      throw error;
    }
  }

  //TODO: WATCH OUT FOR FETCHING PARTY DATA, WHEN WILL PARTIES UPDATE, WHEN DO THEY NEED TO UPDATE FOR A SPECIFIC PERSON
  Stream<List<Map<String, dynamic>>> getPartyDataStream(String currentUserId) {
    final _parties = instance.collection('parties').snapshots();

    return _parties.map((QuerySnapshot querySnapshot) => querySnapshot == null
        ? null
        : querySnapshot.docs
            .map((QueryDocumentSnapshot documentSnapshot) =>
                documentSnapshot.data())
            .toList());
  }

  //TODO: provide different querying for different situations, this is an example (mby later even devide by country
  //in seperate collections or continents for faster when scaling)
  Stream<List<Map<String, dynamic>>> getPartyDataMoreThanFourPeopleStream(
      String currentUserId) {
    final _parties = instance
        .collection('parties')
        .where('numberOfPeopleComming', isGreaterThan: 4)
        .snapshots();

    return _parties.map((QuerySnapshot querySnapshot) => querySnapshot == null
        ? null
        : querySnapshot.docs
            .map((QueryDocumentSnapshot documentSnapshot) =>
                documentSnapshot.data())
            .toList());
  }

  Stream<Map<String, dynamic>> getUserDataStream(String uid) {
    final DocumentReference documentReference =
        instance.collection('users').doc(uid);
    final stream = documentReference.snapshots();

    return stream.map((DocumentSnapshot event) {
      // print('${event?.data()}');
      // final user = User.fromMap(event?.data());
      // print('USERNAME: ${user?.username}');
      return event.data();
    });
  }
}
