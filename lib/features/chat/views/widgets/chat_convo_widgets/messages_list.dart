import 'package:chatter_box/features/chat/model/message_model.dart';
import 'package:chatter_box/features/user/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'messages_list_item.dart';

class MessagesList extends StatelessWidget {
  final AppUser user; 
  final List<Message> messages;
  const MessagesList({
    super.key,
    required this.messages,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser?>(context);
    return ListView.builder(
        itemCount: messages.length,
        reverse: true,
        itemBuilder: (context, index) {
          final message = messages[index];

          return MessagesListItem(
            isMymessage: message.senderId == appUser?.id,
            message: message,
            user: user, 
          );
        });
  }
}
