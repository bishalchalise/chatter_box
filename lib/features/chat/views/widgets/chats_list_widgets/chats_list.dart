import 'package:chatter_box/features/chat/views/widgets/chats_list_widgets/chats_list_item.dart';
import 'package:flutter/material.dart';
class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const ChatsListItem(),
    );
  }
}