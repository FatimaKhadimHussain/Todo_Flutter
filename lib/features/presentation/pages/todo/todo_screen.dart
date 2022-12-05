import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_assignment/features/presentation/bloc/network/network_bloc.dart';
import 'package:todo_assignment/features/presentation/bloc/todo/todo_bloc.dart';
import 'package:todo_assignment/features/presentation/widgets/todo/todo_list.dart';
import 'package:todo_assignment/injection_container.dart';

class TodoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TodoBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: const TodoListView(),
      ),
    );
  }


}
