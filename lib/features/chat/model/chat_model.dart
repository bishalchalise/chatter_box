class Chat {
  final String id;
  final List<String> userIds;
  final int unreadMessageCount;
  final String lastMessageId; 
  final int createdAt;
  final int updatedAt;

  Chat({
    required this.id,
    required this.userIds,
    required this.unreadMessageCount,
    required this.lastMessageId,
    required this.createdAt,
    required this.updatedAt,
  });
}
