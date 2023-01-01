
class Message {
   String? id;
  final String senderId;
  final List<String> recieverIds;
  final String text;
  final List<String> files;
  final int createdAt;

  Message({
     this.id,
    required this.senderId,
    required this.recieverIds,
    required this.text,
    required this.files,
    required this.createdAt,
  });
}
