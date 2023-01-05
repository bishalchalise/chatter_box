import 'package:chatter_box/features/shared/views/widgets/avatar_builder.dart';
import 'package:chatter_box/features/user/models/user_model.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  final AppUser user;
  final Function(AppUser)? onPressed;

  const UserListItem({
    super.key,
    required this.user,
    this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!(user);
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(
          15.0,
        ),
        child: Row(
          children: [
            AvatarBuilder(imgUrl: user.photo),
            const SizedBox(
              width: 10.0,
            ),
            Text(user.name),
          ],
        ),
      ),
    );
  }
}
