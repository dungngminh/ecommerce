import 'package:cloud_firestore/cloud_firestore.dart';

class FireDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> addUser({required String uid, required String email, String imageUrl = '',
       dynamic joinedDate, dynamic createAt}) async {
    bool status = false;
    await _firestore
        .collection('users')
        .doc(uid)
        .set({
          'id': uid,
          'email': email,
          'imageUrl': imageUrl,
          'joinedDate': joinedDate,
          'createAt': createAt,
        })
        .then((value) => status = true)
        .catchError((error) => status = false);
    return status;
  }
}
