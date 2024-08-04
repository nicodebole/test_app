import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/core/entities/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go("/posts/${post.id}");
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.network(
                fit: BoxFit.cover,
                post.image,
                errorBuilder: (context, error, stackTrace) {
                  return const Placeholder();
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(post.title),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
