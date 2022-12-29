class Chat {
  final String id;
  final List<String> userIds;
  final int unreadMessageCount; 
  final int createdAt;
  final int updatedAt;

  Chat( {
    required this.id,
    required this.userIds,
     required this.unreadMessageCount,
    required this.createdAt,
    required this.updatedAt,
  });
}
