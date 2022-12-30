import 'package:chatter_box/features/user/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  static final _fs = FirebaseFirestore.instance;

  static Stream<AppUser?> getUserFromFirestore({required final String uid}) {
    final userRef = _fs.collection('users').doc(uid);
    return userRef.snapshots().map((userSnap) {
      final data = userSnap.data();
      if (data != null) {
        final appUser = AppUser(
          id: data['id'],
          name: data['name'],
          email: data['email'],
          photo: data['photo'],
        );
        return appUser;
      } else {
        return null;
      }
    });
  }
}
