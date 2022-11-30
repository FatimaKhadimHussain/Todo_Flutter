import 'package:todo_assignment/features/domain/entities/todo/todo_item.dart';

class TodoModel extends TodoItem {
  TodoModel(
      {required super.id, required super.title, required super.completed});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['id'] as int,
        title: json['title'] as String,
        completed: json['completed'] as bool);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed
    };
  }
}
