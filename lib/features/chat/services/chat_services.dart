import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ChatService {
  static final _fs = FirebaseFirestore.instance;
// send message to recievers
  static void sendMessage() async {
    try {

    } catch (e) {
      debugPrint(e.toString()); 
      debugPrint('Error!: Sending Mesaage'); 
    }
  }
}
