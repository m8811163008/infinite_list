import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_list/posts/domain/business_logic_bloc/post_bloc.dart';
import 'package:infinit_list/posts/presentation/widgets/posts_list.dart';

import '../../../service_locator.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocProvider(
        create: (_) => sl<PostBloc>()..add(PostFetched()),
        child: const PostsList(),
      ),
    );
  }
}
