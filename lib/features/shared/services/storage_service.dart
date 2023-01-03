import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class StorageService {
  static final _storage = FirebaseStorage.instance;

// upload given file to storage
 static Future<String?> uploadFile({required final File file}) async {
    try {
      final storageRef = _storage.ref().child('users/shyam/_image.jpg');
      final uploadTask = storageRef.putFile(file);
      await uploadTask.whenComplete(() {});
      final url = await storageRef.getDownloadURL();
      return url;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Error!! Uploading file to storage');
      return null;
    }
  }
}
