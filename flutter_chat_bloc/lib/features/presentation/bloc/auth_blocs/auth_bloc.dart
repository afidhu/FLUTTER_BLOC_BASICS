import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bloc/features/services/app_services.dart';

import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/register_usecase.dart';
import 'auth_events.dart';
import 'auth_states.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// final storage = FlutterSecureStorage();
class AuthBloc extends Bloc<AuthEvents,AuthState>{




  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  AuthBloc(this.loginUseCase, this.registerUseCase):super(InitialRegister()){
    on<RegisterEvent>(_register);
    on<LoginEvent>(_login);
  }

  Future<void> _register( RegisterEvent event, Emitter emit) async{
    print('RegisterEvent');
    emit(LoadingAuth());
    try{
      // final user = await registerUseCase.call(event.email, event.password,event.username);
      final user = await registerUseCase(event.email, event.password,event.username);
      emit(SuccessRegister('Success Create account :${user.email}'));
    } catch(e){
      print(e.toString());
      emit(ErrorRegister(e.toString()));
    }
  }

  Future<void> _login( LoginEvent event, Emitter emit) async{
    emit(LoadingAuth());
    try{
    final user = await loginUseCase(event.email, event.password);
    // await AppService().storage.write(key: 'userId', value: user.id.toString());
    await AppService().getXStorage.write('userId', user.id.toString());
    print(user);
    emit(SuccessLogin('Success Create account :${user.name}'));
    } catch(e){
      emit(LoginError(e.toString()));
    }
  }

}