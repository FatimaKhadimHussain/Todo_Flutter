import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_assignment/core/usecases/usecase.dart';
import 'package:todo_assignment/features/domain/entities/todo/todo_item.dart';
import 'package:todo_assignment/features/domain/repositories/todo/todo_repository.dart';
import 'package:todo_assignment/features/domain/use_cases/todo/load_todos.dart';

import 'load_todos_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<TodoRepository>(as: #MockTodoRepository),
])
void main() {
  late MockTodoRepository mockTodoRepository;
  late LoadTodos usecase;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = LoadTodos(todoRepository: mockTodoRepository);
  });

  final tTodoItem = TodoItem(id: 1, title: 'Task 1', completed: false);
  final tTodoItems = [tTodoItem];

  test('should return Todo list from the repository ', () async {
    //arrange
    when(mockTodoRepository.loadTodos()).thenAnswer((_) async => Right(tTodoItems));

    //act
    final result = await usecase(NoParams());

    //assert
    expect(result, Right(tTodoItems));
    verify(mockTodoRepository.loadTodos());
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
