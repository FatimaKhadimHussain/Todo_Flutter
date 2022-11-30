import 'package:dartz/dartz.dart';
import 'package:todo_assignment/core/error/failures.dart';
import 'package:todo_assignment/features/domain/entities/todo/todo_item.dart';
import 'package:todo_assignment/features/domain/repositories/todo/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {

  @override
  Future<Either<Failure, List<TodoItem>>> loadTodos() {
    // TODO: implement loadTodos
    throw UnimplementedError();
  }

}