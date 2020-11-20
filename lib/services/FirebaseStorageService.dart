import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage instance = FirebaseStorage.instance;

  Future<String> storeUserImage(File image, String uid) async {
    try {
      return _storeFile(file: image, path: 'userImages/$uid/avatar.png');
    } catch (error) {
      throw error;
    }
  }

  Future<String> _storeFile({
    File file,
    String path,
    StorageMetadata storageMetadata,
  }) async {
    final StorageReference reference = instance.ref().child(path);
    final uploadTask = reference.putFile(file, storageMetadata);
    final snapshot = await uploadTask.onComplete;
    if (snapshot.error != null) {
      throw snapshot.error;
    } else {
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    }
  }
}
