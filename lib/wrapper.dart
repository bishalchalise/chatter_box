import 'package:chatter_box/features/authentication/views/screens/login_screen.dart';
import 'package:chatter_box/features/chat/views/screens/chats_list_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<User?>(context);
    if (authState == null) {
      return const LoginScreen();
    } else {
      return const ChatsListScreen();
    }
  }
}
