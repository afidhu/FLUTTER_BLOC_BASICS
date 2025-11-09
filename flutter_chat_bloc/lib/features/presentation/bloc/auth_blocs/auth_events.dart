
abstract class AuthEvents{}

class RegisterEvent extends AuthEvents{
  final String username;
  final String email;
  final String password;
  RegisterEvent(this.username, this.email, this.password);
}

class LoginEvent extends AuthEvents{
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
}



//
// class LoadingRegisterEvent extends AuthEvents{}
//
// class SuccessRegisterEvent extends AuthEvents{}