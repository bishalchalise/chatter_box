import 'package:chatter_box/features/chat/services/chat_services.dart';
import 'package:flutter/material.dart';

import '../model/message_model.dart';

class ChatConvoVm extends ChangeNotifier {
  final TextEditingController _messageController = TextEditingController();
  TextEditingController get messageController => _messageController;

  void sendMessage() {
    final text = _messageController.text;
    final message = Message(
      senderId: 'KcIv44NXZOhnhsOhSsaUZb23eR23',
      recieverIds: ['evY0GOVOPAenQ6tzs0VSmrF0yzx1'],
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
