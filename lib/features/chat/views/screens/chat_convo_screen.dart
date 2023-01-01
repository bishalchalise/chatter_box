import 'package:chatter_box/features/chat/viewmodels/chat_convo_vm.dart';
import 'package:chatter_box/features/chat/views/widgets/chat_convo_widgets/message_input.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/chat_services.dart';
import '../widgets/chat_convo_widgets/messages_list.dart';

class ChatConvoScreen extends StatelessWidget {
  const ChatConvoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatConvoVm(),
      builder: ((context, child) {
        final vm = Provider.of<ChatConvoVm>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Bishal Chalise',
            ),
          ),
          body: StreamBuilder(
            stream: ChatService.messagesList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final messages = snapshot.data;
                if (messages != null) {
                  return MessagesList(
                    messages: messages,
                  );
                } else {
                  return Container();
                }
              } else {
                return Container();
              }
            },
          ),
          bottomNavigationBar: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: MessageInput(
                controller: vm.messageController,
                onPressedSend: () {
                  vm.sendMessage();
                }),
          ),
        );
      }),
    );
  }
}
