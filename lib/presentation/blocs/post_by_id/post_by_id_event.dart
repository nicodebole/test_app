part of 'post_by_id_bloc.dart';

sealed class PostByIdEvent extends Equatable {
  const PostByIdEvent();

  @override
  List<Object> get props => [];
}


class LoadPostById extends PostByIdEvent {
  final int id;

  const LoadPostById(this.id);

  @override
  List<Object> get props => [id];
}