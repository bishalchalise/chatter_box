import 'dart:io';

class Message {
  final String id;
  final String senderId;
  final List<String> recieverIds;
  final String text;
  final List<File> file;
  final int createdAt;

  Message({
    required this.id,
    required this.senderId,
    required this.recieverIds,
    required this.text,
    required this.file,
    required this.createdAt,
  });
}
