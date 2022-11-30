import 'package:equatable/equatable.dart';

class TodoItem extends Equatable {
  int id;
  String title;
  bool completed;

  TodoItem({
    required this.id,
    required this.title,
    required this.completed,
  });

  @override
  List<Object?> get props => [id, title, completed];
}
