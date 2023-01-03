import 'package:chatter_box/features/chat/services/chat_services.dart';
import 'package:chatter_box/features/user/models/user_model.dart';
import 'package:flutter/material.dart';

import '../model/message_model.dart';

class ChatConvoVm extends ChangeNotifier {
  final TextEditingController _messageController = TextEditingController();
  TextEditingController get messageController => _messageController;

  void sendMessage({
    required final AppUser? appUser,
    required final AppUser? user,
  }) {
    final text = _messageController.text;
    final message = Message(
      senderId: appUser!.id,
      recieverIds: [user!.id],
      text: text,
      files: [],
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );
    ChatService.sendMessage(
      message: message,
    );

    _messageController.text = '';
  }
}
