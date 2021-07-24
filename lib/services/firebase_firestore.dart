import 'package:cloud_firestore/cloud_firestore.dart';

class FireDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> addUser({
    required String uid,
    required String email,
    String? name,
    String? phoneNumber,
    String? address,
    String? imageUrl,
    dynamic joinedDate,
    dynamic createAt,
  }) async {
    bool status = false;
    await _firestore
        .collection('users')
        .doc(uid)
        .set({
          'id': uid,
          'email': email,
          'name': name,
          'phoneNumber': phoneNumber,
          'address': address,
          'imageUrl': imageUrl,
          'joinedDate': joinedDate,
          'createAt': createAt,
        })
        .then((value) => status = true)
        .catchError((error) => status = false);
    return status;
  }

  Future<bool> isExistInFirestore(String uid) async {
    bool status = false;
    await _firestore
        .collection('users')
        .doc(uid)
        .get()
        .then((data) => status = data.exists ? true : false);
    return status;
  }

  Future<DocumentSnapshot> getUserInfoByUID(String uid) async =>
      await _firestore.collection('users').doc(uid).get();
}
