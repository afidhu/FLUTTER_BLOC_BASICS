
abstract class AuthState{}


class InitialRegister extends AuthState{}
class LoadingAuth extends AuthState{}

class SuccessRegister extends AuthState{
  final String message;
  SuccessRegister(this.message);


}
class SuccessLogin extends AuthState{
  final String message;
  SuccessLogin(this.message);
}

class LoginError extends AuthState{
  final String errorMessage;
  LoginError(this.errorMessage);
}

class ErrorRegister extends AuthState{
  final String errorMessage;
  ErrorRegister(this.errorMessage);
}


