import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_c_b/model/to_do_model.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, List<ToDoModel>> {
  TodoBloc() : super([]) {
    on<AddTask>((event, emit) {
      final todoBloc = ToDoModel(name: event.titel, createAt: DateTime.now());
      state.add(todoBloc);
      emit(state);
    });
    on<RemoveTask>((event, emit) {
      final updateList = List<ToDoModel>.from(state)..remove(event.toDoModel);
      emit(updateList);
    });
  }
}
