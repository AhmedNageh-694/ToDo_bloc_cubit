import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_c_b/bloc/todo_bloc.dart';
import 'package:to_do_app_c_b/cubit/todo_cubit.dart';
import 'package:to_do_app_c_b/view/to_do_list.dart';
import 'package:to_do_app_c_b/view/to_do_view.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {'/': (_) => const ToDoList(), '/todoview': (_) => ToDoView()},
      ),
    ); 
  }
}
