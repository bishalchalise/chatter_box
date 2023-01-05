import 'package:chatter_box/features/chat/viewmodels/chat_convo_vm.dart';
import 'package:chatter_box/features/chat/views/widgets/chat_convo_widgets/message_input.dart';
import 'package:chatter_box/features/shared/views/widgets/avatar_builder.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../user/models/user_model.dart';
import '../../model/chat_model.dart';
import '../../services/chat_services.dart';
import '../widgets/chat_convo_widgets/messages_list.dart';

class ChatConvoScreenArgs {
  final AppUser user;
  final String? chatId;
  ChatConvoScreenArgs({
    required this.user,
    this.chatId,
  });
}

class ChatConvoScreen extends StatelessWidget {
  final AppUser user;
  final String? chatId;
  const ChatConvoScreen({
    super.key,
    required this.user,
    this.chatId,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatConvoVm(
        context: context,
      ),
      builder: ((context, child) {
        final vm = Provider.of<ChatConvoVm>(context);
        final appUser = Provider.of<AppUser?>(context);
        final chatsList = Provider.of<List<Chat>>(context);

        Chat? chat;
        for (var element in chatsList) {
          if (element.userIds.contains(user.id)) {
            chat = element;
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                AvatarBuilder(imgUrl: user.photo,
                size: 30.0, ), 
                const SizedBox(width: 10.0,),
                Text(
                  user.name,
                ),
              ],
            ),
          ),
          body: chat == null
              ? const SizedBox()
              : StreamBuilder(
                  stream: ChatService.messagesList(
                    chatId: chat.id,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final messages = snapshot.data;
                      if (messages != null) {
                        return MessagesList(
                          messages: messages,
                          user: user,
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
              selectedPictures: vm.selectedPictures,
              onPressedSend: () {
                vm.sendMessage(
                  appUser: appUser,
                  user: user,
                  chatId: chat?.id,
                );
              },
              onPressedSelect: () {
                vm.pickImage();
              },
              onPressedRemoveImage: (file) {
                final pictures = vm.selectedPictures;
                pictures.remove(file);
                vm.updateSelectedPictures(pictures);
              },
            ),
          ),
        );
      }),
    );
  }
}
