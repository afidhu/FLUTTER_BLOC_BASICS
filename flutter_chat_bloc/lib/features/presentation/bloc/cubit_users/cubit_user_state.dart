
import '../../../data/models/users_model.dart';

abstract class UserState{}

class UserInitial extends UserState{}
class LoadingUser extends UserState{}
class ErrorUser extends UserState{
  String error;
  ErrorUser(this.error);
}
class LoadedUser extends UserState{

  List<UsersModel> usersList;
  LoadedUser(this.usersList);
}