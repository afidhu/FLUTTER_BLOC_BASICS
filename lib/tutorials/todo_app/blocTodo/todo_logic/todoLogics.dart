
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basics/tutorials/todo_app/blocTodo/todo_events/todoEvents.dart';
import 'package:flutter_bloc_basics/tutorials/todo_app/blocTodo/todo_state/todoStates.dart';

import '../../data/apiService/api_service.dart';
import '../../data/model/todo_model.dart';

class TodoBloc extends Bloc<TodoEvents, TodoState>{
  TodoBloc():super(TodoInitial()){

    on<TodoFetch>((event, emit)async{
      emit(TodoLoading());

      try{
        final todoDatas = await ApiServiceTodo().fetchPost();
        emit(TodoData(todoDatas));
      }
      catch(e){
        emit(TodoError(e.toString()));
      }
    });

    
    on<TodoAdd>((event, emit) async{
      emit(TodoLoading());
      
      try{
        TodoModel todoModel=TodoModel(
          title: event.title,
          price: event.price,
          description: event.description,
        ) ;
        print(todoModel);
        await ApiServiceTodo().addPost(todoModel);
        emit(TodoSuccess('Todo Added Successfully'));
        final updatedList = await ApiServiceTodo().fetchPost();

        //  Emit updated list so UI updates automatically
        emit(TodoData(updatedList));


      } catch(e){
        emit(TodoError(e.toString()));

      }
      
      
    });
  }
}