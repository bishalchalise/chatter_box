import 'package:chatter_box/features/chat/views/widgets/chats_list_widgets/chats_list.dart';
import 'package:flutter/material.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatsList(),
    );
  }
}
