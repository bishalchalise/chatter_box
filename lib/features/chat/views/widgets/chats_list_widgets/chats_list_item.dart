import 'package:chatter_box/features/shared/views/widgets/avatar_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChatsListItem extends StatelessWidget {
  const ChatsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const AvatarBuilder(
                imgUrl:
                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
              ),
              const SizedBox(
            width: 10.0,
          ),
          _bodyBuilder(),
            ],
          ),
          
          _counterBuilder(),
        ],
      ),
    );
  }

  Widget _bodyBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'Description jjj jhfjj hjfhvv hfvyfvjvvjgg ',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }

  Widget _counterBuilder() {
    return Container(
      padding: const EdgeInsets.all(
        2.0,
      ),
      decoration: BoxDecoration(
        color: Colors.red.shade400,
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
      child: const Text(
        '12',
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
