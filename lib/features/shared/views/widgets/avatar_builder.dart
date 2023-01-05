import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarBuilder extends StatelessWidget {
  final String imgUrl;
  final double size;
  const AvatarBuilder({
    super.key,
    this.size = 50.0,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        
        color: Colors.grey.shade300,
        image: imgUrl == ''
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider(imgUrl),
                fit: BoxFit.cover,
              ),
      ),
      
    );
  }
}
