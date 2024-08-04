part of 'post_by_id_bloc.dart';

sealed class PostByIdState extends Equatable {
  const PostByIdState();

  @override
  List<Object> get props => [];
}

final class PostByIdInitial extends PostByIdState {}

final class PostByIdLoading extends PostByIdState {}

final class PostByIdLoaded extends PostByIdState {
  final Post post;

  const PostByIdLoaded(this.post);

  @override
  List<Object> get props => [post];
}

final class PostByIdError extends PostByIdState {
  final String message;

  const PostByIdError(this.message);

  @override
  List<Object> get props => [message];
}
