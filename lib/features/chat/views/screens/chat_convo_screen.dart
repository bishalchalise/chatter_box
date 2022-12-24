import 'package:chatter_box/features/chat/views/widgets/chat_convo_widgets/message_input.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_convo_widgets/messages_list.dart'; 

class ChatConvoScreen extends StatelessWidget {
  const ChatConvoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Bishal Chalise'),
      ),
      body: const MessagesList(),
      bottomNavigationBar:  Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const MessageInput(),
      ),
    );
  }
}