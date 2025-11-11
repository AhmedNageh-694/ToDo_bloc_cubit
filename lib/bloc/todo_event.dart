part of 'todo_bloc.dart';

sealed class TodoEvent {}

class AddTask extends TodoEvent {
  final String titel;
  AddTask(this.titel);
}

class RemoveTask extends TodoEvent {
  final ToDoModel toDoModel;
  RemoveTask({required this.toDoModel});
}
