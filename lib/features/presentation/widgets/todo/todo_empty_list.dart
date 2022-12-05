import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_assignment/features/presentation/bloc/network/network_bloc.dart';
import '../../bloc/todo/todo_bloc.dart';
import 'package:todo_assignment/core/utils/constants.dart';

class EmptyListScreen extends StatelessWidget {
  const EmptyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Something went wrong',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Get it another try',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                if (BlocProvider.of<NetworkBloc>(context).state is
                    NetworkSuccess) {
                  BlocProvider.of<TodoBloc>(context).add(GetTodos());
                } else {
                  showAlertwDialog(context, 'Internet is not connected');
                }
              },
              child: const Text('RELOAD')),
        ],
      ),
    );
  }
}
