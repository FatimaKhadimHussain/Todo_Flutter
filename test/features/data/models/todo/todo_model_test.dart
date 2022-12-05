import 'dart:convert';
import 'dart:math';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_assignment/features/data/models/todo/todo_model.dart';
import 'package:todo_assignment/features/domain/entities/todo/todo_item.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTodoModel1 = TodoModel(id: 1, title: 'Task 1', completed: false);
  final tTodoModel2 = TodoModel(id: 2, title: 'Task 2', completed: true);
  final tTodoModels = [tTodoModel1, tTodoModel2];

  test('should be a subclass of TodoItem', () async {
    expect(tTodoModel1, isA<TodoItem>());
  });

  group('fromJson', () {
    test('should return [TodoModel] from json', () async {
      //arrange
      final List mapJson = json.decode(fixture('todo.json'));
      final result = mapJson.map((json) => TodoModel.fromJson(json));

      //assert
      expect(result, tTodoModels);
    });
  });

   group('toJson', () {
     test('should return a json map containing the proper data', () async {
       final result = tTodoModels.map((todoModel) => todoModel.toJson());
       final expectedResult = [
         {
           "id": 1,
           "title": "Task 1",
           "completed": false
         },
         {
           "id": 2,
           "title": "Task 2",
           "completed": true
         }
       ];

       expect(result, expectedResult);
     });
   });
}
