import 'package:dartz/dartz.dart';
import 'package:todo_assignment/core/error/exceptions.dart';
import 'package:todo_assignment/core/error/failures.dart';
import 'package:todo_assignment/features/data/data_sources/todo/todo_remote_data_source.dart';
import 'package:todo_assignment/features/domain/entities/todo/todo_item.dart';
import 'package:todo_assignment/features/domain/repositories/todo/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  const TodoRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<TodoItem>>> loadTodos() async {
    try {
      final todoList = await remoteDataSource.getTodos();
      if (todoList == null) {
        throw ServerException();
      }
      return Right(todoList);
    } on ServerException{
      return left(Serverfailure());
    }
  }
}
