import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../auth/utils/auth_utils.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({super.key, this.radius = 15.0});

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Hero(
        tag: 'userCircleAvatar',
        child: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(auth.safePhotoUrl),
          radius: radius,
        ),
      ),
    );
  }
}
