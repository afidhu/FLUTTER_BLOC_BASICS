import 'package:flutter_bloc_basics/tutorials/todo_app/data/model/todo_model.dart';

abstract class TodoState{}

class TodoInitial extends TodoState{}

class TodoLoading extends TodoState{}

class TodoError extends TodoState{
  final String errorMessage;
  TodoError(this.errorMessage);
}

class TodoSuccess extends TodoState{
  final String successMessage;
  TodoSuccess(this.successMessage);
}

class TodoData extends TodoState{
  List<TodoModel> todos;
  TodoData(this.todos);
}