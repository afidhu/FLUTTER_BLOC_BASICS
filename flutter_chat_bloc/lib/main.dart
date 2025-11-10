import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bloc/core/theme_colors.dart';
import 'package:flutter_chat_bloc/features/data/datasource/auth_datasource.dart';
import 'package:flutter_chat_bloc/features/domain/repositories/auth_repository_impl.dart';
import 'package:flutter_chat_bloc/features/domain/repositories/auth_repository_impl.dart';
import 'package:flutter_chat_bloc/features/domain/usecases/login_usecase.dart';
import 'package:flutter_chat_bloc/features/domain/usecases/register_usecase.dart';
import 'package:flutter_chat_bloc/features/presentation/bloc/auth_blocs/auth_bloc.dart';
import 'package:flutter_chat_bloc/features/services/app_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter_chat_bloc/presentation/messages/message_page.dart';
// import 'package:flutter_chat_bloc/views/auth/register.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'features/domain/repositories/message_repository.dart';
import 'features/domain/repositories/users_repository.dart';
import 'features/presentation/bloc/cubit_users/cubit_users.dart';
import 'features/presentation/bloc/message_bloc/messages_blocs.dart';
import 'features/presentation/bloc/socketIo_chat/chat_cubit.dart';
import 'features/presentation/views/auth/register.dart';

void main() async {
  await GetStorage.init();
AppService();
  final authRepository = AuthRepositoryImpl(AuthRemoteDataSource());
  final messageRepository = MessageRepository(AuthRemoteDataSource());

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_)=>UsersRepository(AuthRemoteDataSource())),
        RepositoryProvider<AuthRepositoryImpl>(
          create: (_) => authRepository,
        ),
        RepositoryProvider<MessageRepository>(
          create: (_) => messageRepository,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>ChatCubit()),
        BlocProvider(
          create: (_) => UserCubit(),
        ),
        BlocProvider(
          create: (_) => MessagesBloc(
            context.read<MessageRepository>(),
          ),
        ),
        BlocProvider(
          create: (_) => AuthBloc(
            LoginUseCase(context.read<AuthRepositoryImpl>()),
            RegisterUseCase(context.read<AuthRepositoryImpl>()),
          ),
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.dark(brightness: Brightness.light),
        ),
        home: RegisterScreen(),
      ),
    );
  }
}

