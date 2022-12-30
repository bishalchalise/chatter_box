import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _fs = FirebaseFirestore.instance;
  // register user with email and pass
  static Future<String?> registerUser({
    required final String name,
    required final String email,
    required final String password,
    required final String photo,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user?.uid != null) {
        saveUserDetailsToFirestore(
            uid: result.user!.uid, 
            name: name, 
            email: email,
            photo: photo,
            );
      }
      
      return result.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Fluttertoast.showToast(msg: 'The email you have entered is invalid');
      } else if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'The email is not registered. Please register to login in.');
      } else {
        Fluttertoast.showToast(
          msg: 'Error: ${e.message}',
        );
      }
      return null;
    }
  }

// login user with email and password
  static Future<String?> loginUser({
    required final String email,
    required final String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint('User with UID: ${result.user?.uid} is logged in.');
      return result.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Fluttertoast.showToast(msg: 'The email you have entered is invalid');
      } else if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'The email is not registered. Please register to login in.');
      } else {
        Fluttertoast.showToast(
          msg: 'Error: ${e.message}',
        );
      }
      return null;
    }
  }

// logout user

  static void logoutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Error!!!: Logging Out!');
    }
  }

//save user details in fire store

  static Future<void> saveUserDetailsToFirestore({
    required final String uid,
    required final String name,
    required final String email,
    required final String photo,
  }) async {
    try {
      final usersRef = _fs.collection('users').doc();
      await usersRef.set({
        'uid': uid,
        'name': name,
        'email': email,
        'photo': photo,
      });
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Error! Saving your details');
    }
  }

//check user is already authenticated or not?
  static Stream<User?> checkAuthState() {
    return _auth.authStateChanges();
  }
}
