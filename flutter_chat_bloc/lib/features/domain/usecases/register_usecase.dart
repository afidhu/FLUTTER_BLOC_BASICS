import '../enities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase{
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<UserEntity> call(String email, String password, String name) async {
    return await repository.register(email, password,name);
  }


}