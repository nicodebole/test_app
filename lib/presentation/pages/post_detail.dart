import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/entities/post.dart';
import 'package:test_app/presentation/blocs/post_by_id/post_by_id_bloc.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostByIdBloc>().add(LoadPostById(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostByIdBloc, PostByIdState>(
      builder: (context, state) {
        if (state is PostByIdLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is PostByIdLoaded) {
          final post = state.post;
          return Scaffold(
            body: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                _CustomSliverAppBar(post: post),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _PostDetails(post: post),
                    childCount: 1,
                  ),
                ),
              ],
            ),
          );
        }

        return const Text("OTHER");
      },
    );
  }
}

class _PostDetails extends StatelessWidget {
  const _PostDetails({
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text('Category: ${post.category}'),
        const SizedBox(height: 16),
        Text("Content: ${post.content}"),
        const SizedBox(height: 16),
        Text("Image: ${post.image}"),
        const SizedBox(height: 16),
        Text("Slug: ${post.slug}"),
        const SizedBox(height: 16),
        Text("Status: ${post.status}"),
        const SizedBox(height: 16),
        Text("Thumbnail: ${post.thumbnail}"),
        const SizedBox(height: 16),
        Text("Url: ${post.url}"),
      ],
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  const _CustomSliverAppBar({
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        centerTitle: true,
        title: Text(
          post.title,
          style: const TextStyle(
            fontSize: 20,
          ),
          // textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                post.image,
                fit: BoxFit.cover,
                // loadingBuilder: (context, child, loadingProgress) {
                //   if (loadingProgress != null) return const SizedBox();

                //   return FadeIn(child: child);
                // },
              ),
            ),
            const _CustomGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black87,
              ],
              stops: [
                0.8,
                1.0,
              ],
            ),
            const _CustomGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black87,
                Colors.transparent,
              ],
              stops: [
                0.0,
                0.2,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {
  const _CustomGradient({
    required this.begin,
    required this.end,
    required this.colors,
    this.stops,
  });

  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<Color> colors;
  final List<double>? stops;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: begin,
            end: end,
          ),
        ),
      ),
    );
  }
}
