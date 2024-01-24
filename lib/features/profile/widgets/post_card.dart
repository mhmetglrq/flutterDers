import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/extensions/context_extension.dart';
import 'package:flutter_application_1/core/models/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'profile_circle.dart';

class PostCard extends ConsumerWidget {
  const PostCard({
    super.key,
    required this.postModel,
  });

  final PostModel postModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ProfileCircle(
                  profilePhoto: postModel.profilePhotoUrl,
                  radius: context.dynamicWidth(0.08),
                ),
                Text(
                  postModel.creator,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.more_horiz_rounded,
              color: Colors.grey,
            ),
          ],
        ),
        Padding(
          padding: context.paddingTopLow,
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.network(
              postModel.contentUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () async {},
                  icon: const Icon(
                    Icons.heart_broken,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${postModel.likeCount}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cloud,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
