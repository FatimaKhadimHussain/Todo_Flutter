import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:todo_assignment/core/error/exceptions.dart';
import 'package:todo_assignment/features/data/data_sources/todo/todo_remote_data_source.dart';
import 'package:todo_assignment/features/data/models/todo/todo_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'todo_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>(as: #MockHttpClient)])
void main() {
  late MockHttpClient mockHttpClient;
  late TodoRemoteDataSourceImpl todoRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    todoRemoteDataSourceImpl =
        TodoRemoteDataSourceImpl(httpClient: mockHttpClient);
  });

  void setupMockHttpClientSuccess200() {
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response(fixture('todo.json'), 200));
  }

  void setupMockHttpClientIsNot200() {
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  final tTodoModel1 = TodoModel(id: 1, title: 'Task 1', completed: false);
  final tTodoModel2 = TodoModel(id: 2, title: 'Task 2', completed: true);
  final tTodoModels = [tTodoModel1, tTodoModel2];

  group('getTodos', () {
    test('should perform a GET server to server with todos as endpoint',
        () async {
      //arrange
      setupMockHttpClientSuccess200();

      //act
      final result = todoRemoteDataSourceImpl.getTodos();

      //assert
      verify(mockHttpClient
          .get(Uri.parse("https://jsonplaceholder.typicode.com/todos")));
    });

    test('should return todos when response is 200', () async {
      //arrange
      setupMockHttpClientSuccess200();

      //act
      final result = await todoRemoteDataSourceImpl.getTodos();

      //assert
      expect(result, tTodoModels);
    });

    test('should return failure when response is not 200', () async {
      //arrange
      setupMockHttpClientIsNot200();

      //act
      final call = todoRemoteDataSourceImpl.getTodos;

      //assert
      expect(() => call(), throwsA(TypeMatcher<ServerException>()));
    });
  });
}
