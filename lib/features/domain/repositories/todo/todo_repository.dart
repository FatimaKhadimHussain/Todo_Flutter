
import 'package:dartz/dartz.dart';
import 'package:todo_assignment/core/error/failures.dart';

import '../../entities/todo/todo_item.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoItem>>>loadTodos();
}