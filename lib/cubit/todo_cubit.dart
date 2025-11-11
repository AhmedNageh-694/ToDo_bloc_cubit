import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_c_b/model/to_do_model.dart';

class TodoCubit extends Cubit<List<ToDoModel>> {
  TodoCubit() : super([]);
  void addToDo(String titel) {
    final todo = ToDoModel(name: titel, createAt: DateTime.now());
    state.add(todo);
    emit([...state]);
  }

  void removeToDo(ToDoModel todo) {
    final updateList = List<ToDoModel>.from(state)..remove(todo);
    emit(updateList);
  }

}
