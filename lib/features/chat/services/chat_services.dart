import 'package:chatter_box/features/chat/model/chat_model.dart';
import 'package:chatter_box/features/chat/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatService {
  static final _fs = FirebaseFirestore.instance;
// send message to recievers
  static void sendMessage({
    required final Message message,
     final String? chatId,
  }) async {
    try {
      final currentTime = DateTime.now().millisecondsSinceEpoch;
      final chatsRef = _fs.collection('chats').doc(chatId);
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
        createdAt: currentTime,
        updatedAt: currentTime,
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
  static Stream<List<Message>> messagesList({required final String chatId}) {
    return _fs
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy(
          'created_at',
          descending: true,
        )
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

// create stream of chats collection

  static Stream<List<Chat>> chatsList() {
    return _fs.collection('chats').snapshots().map((chatSnap) {
      List<Chat> chats = [];
      for (final document in chatSnap.docs) {
        final data = document.data();
        final chat = Chat(
          id: data['id'],
          userIds: List<String>.from(data['user_ids']),
          unreadMessageCount: data['unread_message_count'],
          lastMessageId: data['last_message_id'],
          createdAt: data['created_at'],
          updatedAt: data['updated_at'],
        );
        chats.add(chat);
      }

      return chats;
    });
  }

// Create stream of  message

  static Stream<Message?> message({
    required final String chatId,
    required final String messageId,
  }) {
    return _fs
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(messageId)
        .snapshots()
        .map((messageSnap) {
      final data = messageSnap.data();
      if (data != null) {
        final message = Message(
          id: data['id'],
          senderId: data['sender_id'],
          recieverIds: List<String>.from(data['reciever_ids']),
          text: data['text'],
          files: List<String>.from(data['files']),
          createdAt: data['created_at'],
        );
        return message;
      } else {
        return null;
      }
    });
  }
}
