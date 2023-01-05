import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
    // final appUser = Provider.of<AppUser?>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment:
            isMymessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
        
         
          Column(
             crossAxisAlignment:
            isMymessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (message.files.isNotEmpty) _imageMessageBuilder(context),
              const SizedBox(height: 5.0,),
              if (message.text != '') _messageBoxBuilder(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _messageBoxBuilder(final BuildContext context) {
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

  Widget _imageMessageBuilder(final BuildContext context) {
    return Wrap(
     alignment: isMymessage ? WrapAlignment.end : WrapAlignment.start,
      children: [
        for (final picture in message.files)
         Container(
          height: 200.0,
          margin: const EdgeInsets.only(left: 10.0, bottom: 10.0,) ,
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
               picture,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
