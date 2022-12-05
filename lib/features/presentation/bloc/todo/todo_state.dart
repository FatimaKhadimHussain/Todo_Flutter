part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoItem> todos;

  const TodoLoaded({
    required this.todos,
  });
}

class TodoError extends TodoState {
  final String message;

  const TodoError({
    required this.message,
  });
}
