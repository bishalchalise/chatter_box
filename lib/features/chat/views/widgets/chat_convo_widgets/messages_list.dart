import 'package:chatter_box/features/chat/model/message_model.dart';
import 'package:flutter/material.dart';
import 'messages_list_item.dart';

class MessagesList extends StatelessWidget {
  final List<Message> messages;
  const MessagesList({
    super.key,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        reverse: true,
        itemBuilder: (context, index) {
          final message = messages[index];
          return MessagesListItem(
            isMymessage: index % 2 == 0 ? true : false,
                message: message,
          );
        });
  }
}
