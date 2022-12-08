import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_assignment/features/presentation/bloc/network/network_bloc.dart';
import 'package:todo_assignment/features/presentation/widgets/todo/todo_empty_list.dart';
import 'package:todo_assignment/features/presentation/widgets/todo/todo_tile.dart';

import '../../bloc/todo/todo_bloc.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  // @override
  // Future<void> initState() async {
  //   super.initState();
  //   context.read<TodoBloc>().add(GetTodos());
  //    final networkStatus = BlocProvider.of<NetworkBloc>(context);
  //    final networkState = await context.read<NetworkBloc>().state;
  //    print('network Stattus:$networkStatus');
  //    print('networrk state:$networkState');
  //    if (networkStatus != NetworkFailure) {
  //      context.read<TodoBloc>().add(GetTodos());
  //    }
  // }
  // //
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final networkStatus = await context.read<NetworkBloc>().state;
    if (networkStatus != NetworkFailure) {
      context.read<TodoBloc>().add(GetTodos());
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget _showLoading() {
      return const Center(child: CircularProgressIndicator());
    }

    return BlocConsumer<NetworkBloc, NetworkState>(
      listener: (context, state) {
        if (state is NetworkSuccess) {
          BlocProvider.of<TodoBloc>(context).add(GetTodos());
        }
      },
      builder: (context, state) {
        return BlocBuilder<NetworkBloc, NetworkState>(
            builder: (networkContext, networkState) {
          if (networkState is NetworkSuccess) {
            print("Success");
            return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
              if (state is TodoLoaded) {
                return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return TodoTile(
                        todo: state.todos[index],
                      );
                    });
              } else if (state is TodoError) {
                return EmptyListScreen();
              }
              return _showLoading();
            });
          } else if (networkState is NetworkFailure) {
            return EmptyListScreen();
          } else {
            return _showLoading();
          }
        });
      },
    );
  }
}
