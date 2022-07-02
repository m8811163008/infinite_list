import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinit_list/posts/domain/models/post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<PostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
