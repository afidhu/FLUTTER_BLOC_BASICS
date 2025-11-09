import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bloc/core/theme_colors.dart';
import 'package:flutter_chat_bloc/features/data/datasource/auth_datasource.dart';
import 'package:flutter_chat_bloc/features/domain/repositories/auth_repository_impl.dart';
import 'package:flutter_chat_bloc/features/domain/repositories/auth_repository_impl.dart';
import 'package:flutter_chat_bloc/features/domain/usecases/login_usecase.dart';
import 'package:flutter_chat_bloc/features/domain/usecases/register_usecase.dart';
import 'package:flutter_chat_bloc/features/presentation/bloc/auth_blocs/auth_bloc.dart';
// import 'package:flutter_chat_bloc/presentation/messages/message_page.dart';
// import 'package:flutter_chat_bloc/views/auth/register.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'features/presentation/views/auth/register.dart';

void main() {
  final auReposity = AuthRepositoryImpl(AuthRemoteDataSource());
  runApp( MyApp(authRepository: auReposity,));
}

class MyApp extends StatelessWidget {
  
  final AuthRepositoryImpl authRepository;
  const MyApp({super.key, required this.authRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
          BlocProvider(create: (_)=>AuthBloc(
              LoginUseCase(authRepository),
              RegisterUseCase(authRepository)))
        ],
        child:GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.dark(brightness: Brightness.light)
      ),
      // home: MessagePage()
      // home: ChatPage(),
      home: RegisterScreen(),
    ));
  }
}