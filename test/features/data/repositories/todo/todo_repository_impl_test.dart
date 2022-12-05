import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_assignment/core/error/exceptions.dart';
import 'package:todo_assignment/core/error/failures.dart';
import 'package:todo_assignment/features/data/data_sources/todo/todo_remote_data_source.dart';
import 'package:todo_assignment/features/data/models/todo/todo_model.dart';
import 'package:todo_assignment/features/data/repositories/todo/todo_repository_impl.dart';

import 'todo_repository_impl_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<TodoRemoteDataSource>(as: #MockTodoRemoteDataSource)])

void main() {
  late MockTodoRemoteDataSource mockTodoRemoteDataSource;
  late TodoRepositoryImpl todoRepositoryImpl;

  setUp(() {
    mockTodoRemoteDataSource = MockTodoRemoteDataSource();
    todoRepositoryImpl =
        TodoRepositoryImpl(remoteDataSource: mockTodoRemoteDataSource);
  });

  final tTodoModel1 = TodoModel(id: 1, title: 'Task 1', completed: true);
  final tTodoList = [tTodoModel1];

  test('should return remote data when call to remote data source is success',
      () async {
//arrange
    when(mockTodoRemoteDataSource.getTodos())
        .thenAnswer((_) async => tTodoList);

    //act
    final result = await todoRepositoryImpl.loadTodos();

    //assert
    verify(mockTodoRemoteDataSource.getTodos());
    expect(result, equals(Right(tTodoList)));
  });

  test('should return failure when call to remote data source is unsuccessful',
      () async {
    //arrange
    when(mockTodoRemoteDataSource.getTodos()).thenThrow(ServerException());

    //act
    final result = await todoRepositoryImpl.loadTodos();

    //assert
    verify(mockTodoRemoteDataSource.getTodos());
    expect(result, equals(Left(Serverfailure())));
  });
}
