import 'package:flutter/material.dart';
import '../../../domain/entities/todo/todo_item.dart';

class TodoTile extends StatelessWidget {
  final TodoItem todo;

  TodoTile({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title ?? '', style: TextStyle(
        decoration: todo.completed == true ? TextDecoration.lineThrough : null,
      ),),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: todo.completed ? Icon(Icons.circle_rounded) : Icon(Icons.circle_outlined),
      ),
    );
  }
}