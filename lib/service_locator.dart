import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:infinit_list/posts/data/providers/provider.dart';
import 'package:infinit_list/posts/data/repository/repository.dart';
import 'package:infinit_list/posts/domain/business_logic_bloc/post_bloc.dart';
import 'package:infinit_list/posts/domain/repository.dart';

final GetIt sl = GetIt.instance;

void initServiceLocator() {
  sl.registerFactory(() => PostBloc(sl<PostRepository>()));
  sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImp(sl<PostDataProvider>()));
  sl.registerLazySingleton<PostDataProvider>(
      () => PostDataProviderImp(sl<http.Client>()));
  sl.registerLazySingleton(() => http.Client());
}
