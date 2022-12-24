
import 'package:flutter/material.dart';
import 'messages_list_item.dart';

class MessagesList
 extends StatelessWidget {
  const MessagesList
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        reverse: true,
        itemBuilder: (context, index) {
          return  MessagesListItem(
            isMymessage: index%2==0 ? true : false,
          ); 
        });
  }
}