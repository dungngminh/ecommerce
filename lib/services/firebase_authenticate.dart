import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth get instance => _auth;

  Future<String?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.toLowerCase().trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.toLowerCase().trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<String?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          final result = await _auth.signInWithCredential(
            GoogleAuthProvider.credential(
                accessToken: googleAuth.accessToken,
                idToken: googleAuth.idToken),
          );
          print(result);
          return 'Logged in with ${result.additionalUserInfo!.profile!['email']}';
        } catch (error) {
          return null;
        }
      }
    } else
      return null;
  }
}
