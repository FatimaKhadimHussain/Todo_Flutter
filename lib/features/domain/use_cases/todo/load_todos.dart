
import 'package:dartz/dartz.dart';
import 'package:todo_assignment/core/error/failures.dart';
import 'package:todo_assignment/core/usecases/usecase.dart';
import '../../entities/todo/todo_item.dart';
import '../../repositories/todo/todo_repository.dart';

class LoadTodos implements Usecase< List<TodoItem>, NoParams> {
  final TodoRepository todoRepository;

  const LoadTodos({
    required this.todoRepository,
  });

  @override
  Future<Either<Failure, List<TodoItem>>> call(NoParams params) async {
    return await todoRepository.loadTodos();
  }
}