import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarBuilder extends StatelessWidget {
  final String imgUrl;
  const AvatarBuilder({
    super.key,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        image: DecorationImage(
          image: CachedNetworkImageProvider(imgUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
