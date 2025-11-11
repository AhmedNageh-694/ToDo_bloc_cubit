import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_c_b/bloc/todo_bloc.dart';
import 'package:to_do_app_c_b/cubit/todo_cubit.dart';

class ToDoView extends StatelessWidget {
  ToDoView({super.key});
  final todoTitelController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: todoTitelController,

              decoration: InputDecoration(
                hintText: 'titel',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              if (todoTitelController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please enter something!'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                return; // 🛑 stop here — don’t add anything
              } else {
                todoBloc.add(AddTask(todoTitelController.text));
                Navigator.of(context).pop();
              }
            },
            color: Colors.blueAccent,
            child: Text('add'),
          ),
        ],
      ),
    );
  }
}
