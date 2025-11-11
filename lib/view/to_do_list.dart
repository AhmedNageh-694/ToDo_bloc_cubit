import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_c_b/bloc/todo_bloc.dart';
// import 'package:to_do_app_c_b/cubit/todo_cubit.dart';
import 'package:to_do_app_c_b/model/to_do_model.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});
  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('TO Do List'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: BlocBuilder<TodoBloc, List<ToDoModel>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return Card(
                borderOnForeground: true,
                elevation: 3,

                child: ListTile(
                  title: Text(todo.name),
                  trailing: IconButton(
                    onPressed: () {
                      todoBloc.add(RemoveTask(toDoModel: todo));
                    },
                    icon: Icon(Icons.close, color: Colors.red),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/todoview');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[Icon(Icons.add), Text("New")],
        ),
      ),
    );
  }
}
