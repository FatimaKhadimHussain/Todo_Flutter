import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_assignment/core/usecases/usecase.dart';
import 'package:todo_assignment/features/domain/entities/todo/todo_item.dart';
import 'package:todo_assignment/features/domain/use_cases/todo/load_todos.dart';
import 'package:todo_assignment/features/presentation/bloc/todo/todo_bloc.dart';
import 'package:todo_assignment/core/error/failures.dart';

import 'todo_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LoadTodos>(as: #MockLoadTodos)])
void main() {
  late MockLoadTodos mockLoadTodos;
  late TodoBloc bloc;

  final tTodoItem1 = TodoItem(id: 1, title: 'Task 1', completed: false);
  final tTodoItem2 = TodoItem(id: 2, title: 'Task 2', completed: true);
  final tTodoItems = [tTodoItem1, tTodoItem2];

  setUp(() {
    mockLoadTodos = MockLoadTodos();
    bloc = TodoBloc(loadTodos: mockLoadTodos);
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state should be TodoInitial', () {
    expect(bloc.initialState, TodoInitial());
  });

  group('LoadTodos', () {
    test('should get data from load todos use case', () async {
      // arrange
      when(mockLoadTodos.call(any)).thenAnswer((_) async => Right(tTodoItems));

      // act
      bloc.add(GetTodos());
      await untilCalled(mockLoadTodos.call(any));

      // assert
      verify(mockLoadTodos(NoParams()));
    });

    test(
        'should emit [TodoLoading, TodoLoaded] when data is gotten successfully',
        () async {
      // arrange
      when(mockLoadTodos(any)).thenAnswer((_) async => Right(tTodoItems));

      // assert
      final expected = [
        TodoLoading(),
        TodoLoaded(todos: tTodoItems)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));

      // act
      bloc.add(GetTodos());
    });

    test('should emit [TodoLoading, TodoError] when getting todo data failure',
        () async {
      // arrange
      when(mockLoadTodos.call(any))
          .thenAnswer((_) async => Left(Serverfailure()));

      // assert
      final expected = [
        TodoLoading(),
        TodoError(message: SERVER_FAILURE_MESSAGE)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));

      // act
      bloc.add(GetTodos());
    });
  });
}
