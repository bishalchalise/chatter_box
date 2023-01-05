import 'package:chatter_box/features/user/models/user_model.dart';
import 'package:chatter_box/features/user/views/users_list_widgets/user_list_item.dart';
import 'package:flutter/material.dart';

class UsersList extends StatelessWidget {
  final List<AppUser> users;
  final Function(AppUser)? onPressedUser; 
  const UsersList({
    super.key,
    required this.users,
    required this.onPressedUser,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return UserListItem(
          user: user,
          onPressed: onPressedUser,
        );
      },
    );
  }
}
