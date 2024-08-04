import 'package:test_app/core/entities/post.dart';
import 'package:test_app/core/repositories/posts/post_repository.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);

  Future<List<Post>> execute() {
    return repository.getPosts();
  }
}
