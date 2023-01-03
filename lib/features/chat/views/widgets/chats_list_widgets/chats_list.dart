import 'package:chatter_box/features/chat/model/chat_model.dart';
import 'package:chatter_box/features/chat/views/widgets/chats_list_widgets/chats_list_item.dart';
import 'package:flutter/material.dart';

class ChatsList extends StatelessWidget {
  final List<Chat> chats;
  const ChatsList({
    super.key,
    required this.chats,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index]; 
          return  ChatsListItem(
            chat: chat,
          );
        });
  }
}
