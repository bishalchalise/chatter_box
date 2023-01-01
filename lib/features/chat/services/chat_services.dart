import 'package:chatter_box/features/chat/model/chat_model.dart';
import 'package:chatter_box/features/chat/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatService {
  static final _fs = FirebaseFirestore.instance;
// send message to recievers
  static void sendMessage({
    required final Message message,
  }) async {
    try {
      final currentTIme = DateTime.now().millisecondsSinceEpoch;
      final chatsRef = _fs.collection('chats').doc('text_chat_id');
      final messageRef = chatsRef.collection('messages').doc();

      message.id = messageRef.id;

      await messageRef.set({
        'id': message.id,
        'sender_id': message.senderId,
        'reciever_ids': message.recieverIds,
        'text': message.text,
        'files': message.files,
        'created_at': message.createdAt,
      });

      List<String> userIds = [];
      userIds = message.recieverIds;
      userIds.add(message.senderId);

      final chat = Chat(
        id: chatsRef.id,
        userIds: userIds,
        unreadMessageCount: 0,
        lastMessageId: message.id!,
        createdAt: currentTIme,
        updatedAt: currentTIme,
      );

      await chatsRef.set({
        'id': chat.id,
        'user_ids': chat.userIds,
        'unread_message_count': chat.unreadMessageCount,
        'last_message_id': chat.lastMessageId,
        'created_at': chat.createdAt,
        'updated_at': chat.updatedAt,
      });
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Error!: Sending Mesaage');
    }
  }

//create stream of message collection
  static Stream<List<Message>> messagesList() {
    return _fs
        .collection('chats')
        .doc('text_chat_id')
        .collection('messages')
        .orderBy('created_at', descending: true,)
        .snapshots()
        .map(
      (snapshot) {
        final documents = snapshot.docs;
        List<Message> messages = [];
        for (final document in documents) {
          final data = document.data();

          final message = Message(
            id: data['id'],
            senderId: data['sender_id'],
            recieverIds: List<String>.from(data['reciever_ids']),
            text: data['text'],
            files: List<String>.from(data['files']),
            createdAt: data['created_at'],
          );
          messages.add(message);
        }
        return messages;
      },
    );
  }
}
