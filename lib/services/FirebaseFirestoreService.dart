import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore instance = FirebaseFirestore.instance;

  Future<String> storeDataInACollection(
    Map<String, dynamic> dataToBeStored,
    String collectionPath,
  ) async {
    final storedData =
        await instance.collection(collectionPath).add(dataToBeStored);

    return storedData.id;
  }
}
