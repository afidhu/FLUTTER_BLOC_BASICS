
import '../../data/model/todo_model.dart';

abstract class TodoEvents{}


class TodoAdd extends TodoEvents{
 final String title;
  final double price;
  final String description;

  TodoAdd({required this.title, required this.price, required this.description});
}

class TodoFetch extends TodoEvents{}