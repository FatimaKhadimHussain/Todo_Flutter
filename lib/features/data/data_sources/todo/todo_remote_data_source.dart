
import 'package:http/http.dart' as http;
import 'package:todo_assignment/core/error/exceptions.dart';
import '../../models/todo/todo_model.dart';
import 'dart:convert';


abstract class TodoRemoteDataSource {
  Future<List<TodoModel>>? getTodos();
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  http.Client httpClient;

  TodoRemoteDataSourceImpl({
    required this.httpClient,
  });

  final String _url = 'https://jsonplaceholder.typicode.com/todos';

  @override
  Future<List<TodoModel>>? getTodos() async {
    final response = await httpClient.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      final responseMap = jsonDecode(response.body) as List;
      final list = responseMap.map((json) => TodoModel.fromJson(json)).toList();
      return list;
    } else {
      throw ServerException();
    }
  }
}