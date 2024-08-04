import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/core/entities/post.dart';
import 'package:test_app/core/usecases/posts/get_post_by_id.dart';

part 'post_by_id_event.dart';
part 'post_by_id_state.dart';

class PostByIdBloc extends Bloc<PostByIdEvent, PostByIdState> {
  final GetPostById getPostById;
  final Map<int, Post> _cache = {};

  PostByIdBloc({required this.getPostById}) : super(PostByIdInitial()) {
    on<LoadPostById>(_onLoadPostById);
  }

  void _onLoadPostById(LoadPostById event, Emitter<PostByIdState> emit) async {
    final postId = event.id;

    // Verifica si el post ya está en el cache
    if (_cache.containsKey(postId)) {
      emit(PostByIdLoaded(_cache[postId]!));
      return;
    }

    emit(PostByIdLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      final post = await getPostById.execute(event.id);
      // Almacena el post en el cache
      _cache[postId] = post;
      emit(PostByIdLoaded(post));
    } catch (e) {
      emit(PostByIdError(e.toString()));
    }
  }
}
