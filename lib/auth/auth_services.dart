import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //get firebase auth
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? getUser() {
    return auth.currentUser;
  }

  Future<UserCredential> createUserwithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> signInWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> getSignOut() async {
    await auth.signOut();
  }
}
