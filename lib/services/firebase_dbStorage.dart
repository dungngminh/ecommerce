import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageFirebase {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> saveImageToStorage(
      {required String folder, required String name, File? file}) async {
    try {
      final ref = _storage.ref().child(folder).child('$name.jpg');
      await ref.putFile(file!);
      return await ref.getDownloadURL();
    } catch (error) {
      return null;
    }
  }
}
