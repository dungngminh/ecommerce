import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.toLowerCase().trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return 2;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return 1;
      }
    } catch (e) {
      print(e);
    }
    return 0;
  }

  signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.toLowerCase().trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 2;
      } else if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return 1;
      }
    } catch (e) {
      print(e);
    }
    return 0;
  }
}
