import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:todo_assignment/features/data/data_sources/todo/todo_remote_data_source.dart';
import 'package:todo_assignment/features/data/repositories/todo/todo_repository_impl.dart';
import 'package:todo_assignment/features/presentation/bloc/network/network_bloc.dart';
import 'features/domain/repositories/todo/todo_repository.dart';
import 'features/domain/use_cases/todo/load_todos.dart';
import 'features/presentation/bloc/todo/todo_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// service locator
final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(() => TodoBloc(loadTodos: sl()));
sl.registerFactory(() => NetworkBloc(connectivity: sl()));

  //use cases
  sl.registerLazySingleton(() => LoadTodos(todoRepository: sl()));

  // repository
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(remoteDataSource: sl()));

  //data sources
  sl.registerLazySingleton<TodoRemoteDataSource>(() => TodoRemoteDataSourceImpl(httpClient: sl()));

  // core

  //external
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}