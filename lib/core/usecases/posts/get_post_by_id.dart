import 'package:test_app/core/entities/post.dart';
import 'package:test_app/core/repositories/posts/post_repository.dart';

class GetPostById {
  final PostRepository repository;

  GetPostById(this.repository);

  Future<Post> execute(int id) {
    return repository.getPostById(id);
  }
}
