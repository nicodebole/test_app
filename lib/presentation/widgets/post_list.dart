import 'package:flutter/material.dart';
import 'package:test_app/core/entities/post.dart';
import 'package:test_app/presentation/widgets/post_card.dart';

class PostList extends StatelessWidget {
  const PostList({super.key, required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: posts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width ~/ 175,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostCard(post: post);
        });
  }
}

