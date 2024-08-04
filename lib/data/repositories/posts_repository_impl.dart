import 'package:test_app/core/entities/post.dart';
import 'package:test_app/core/repositories/posts/post_repository.dart';
import 'package:test_app/data/datasources/post_remote_datasource.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Post>> getPosts() {
    return remoteDataSource.getPosts();
  }
  
  @override
  Future<Post> getPostById(int id) {
    return remoteDataSource.getPostById(id);
  }
}
