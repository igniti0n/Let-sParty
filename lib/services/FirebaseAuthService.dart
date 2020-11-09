import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth instance = FirebaseAuth.instance;

  Stream<User> get userSnapshot {
    return instance.authStateChanges();
  }

  Future<void> signIn(String email, String password) async {
    try {
      await instance.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      print(':::::: ERROR WHILE SIGNING IN :::::::');
      throw error;
    }
  }

  Future<void> logOut() async {
    try {
      return await instance.signOut();
    } catch (error) {
      print(':::::: ERROR WHILE LOGING OUT ::::::');
      throw error;
    }
  }
}
