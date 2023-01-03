import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/views/widgets/avatar_builder.dart';
import '../../../../user/models/user_model.dart';
import '../../../model/message_model.dart';

class MessagesListItem extends StatelessWidget {
  final Message message;
  final bool isMymessage;
  final AppUser user;
  const MessagesListItem({
    super.key,
    required this.isMymessage,
    required this.message,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser?>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment:
            isMymessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          AvatarBuilder(
            imgUrl: isMymessage ? appUser!.photo : user.photo,
          ),
          const SizedBox(
            height: 10.0,
          ),
          _messageBox(context)
        ],
      ),
    );
  }

  Widget _messageBox(final BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: isMymessage ? null : primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              isMymessage ? 20.0 : 0.0,
            ),
            topRight: Radius.circular(
              isMymessage ? 0.0 : 20.0,
            ),
            bottomRight: Radius.circular(
              isMymessage ? 20.0 : 20.0,
            ),
            bottomLeft: Radius.circular(
              isMymessage ? 20.0 : 20.0,
            ),
          ),
          border: Border.all(
            color: isMymessage ? primaryColor : Colors.transparent,
          )),
      child: Text(
        message.text,
        style: TextStyle(
          color: isMymessage ? primaryColor : Colors.white,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
