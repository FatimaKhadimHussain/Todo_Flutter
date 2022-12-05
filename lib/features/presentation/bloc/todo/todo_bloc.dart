import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_assignment/core/usecases/usecase.dart';
import '../../../domain/entities/todo/todo_item.dart';
import '../../../domain/use_cases/todo/load_todos.dart';

part 'todo_state.dart';
part 'todo_event.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final LoadTodos loadTodos;

  TodoState get initialState => TodoInitial();

  TodoBloc({required this.loadTodos}) : super(TodoInitial()) {
    on<GetTodos>(_addLoadTodosToState);
  }

  Future<void> _addLoadTodosToState(GetTodos event, Emitter<TodoState> state) async {
    emit(TodoLoading());
    final eitherTodosOrFailure = await loadTodos(NoParams());
    eitherTodosOrFailure.fold((failure) async {
      emit(const TodoError(message: SERVER_FAILURE_MESSAGE));
    }, (todos) async {
      emit((TodoLoaded(todos: todos)));
    });
  }
}
