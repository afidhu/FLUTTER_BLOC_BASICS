import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bloc/features/presentation/bloc/auth_blocs/auth_events.dart';
import 'package:flutter_chat_bloc/features/presentation/views/auth/register.dart';
// import 'package:flutter_chat_bloc/presentation/auth/register.dart';
// import 'package:flutter_chat_bloc/views/auth/register.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../bloc/auth_blocs/auth_bloc.dart';
import '../../bloc/auth_blocs/auth_states.dart';
import '../messages/chat_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(child:Column(
                  children: [
                    BlocConsumer<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is LoadingAuth) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return Container();
                      },
                      listener: (context, state) {
                        if (state is SuccessLogin) {
                          Get.to(ChatPage());
                        } else if (state is LoginError) {
                          Get.snackbar(
                            "Error",
                            state.errorMessage,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        labelText: 'Password',
                        hintText: 'Enter your password',
                      ),
                    )

                  ],
                )
                ),
                const SizedBox(height: 20),

                Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(
                            text: ' Register  an account? ',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(RegisterScreen());
                                }
                          )
                        ]
                    )
                ),


                const SizedBox(height: 20),
                FilledButton(
                    onPressed: (){
                      context.read<AuthBloc>().add(LoginEvent(email: emailController.text, password: passwordController.text));
                    },
                    child: Text('Login')
                )

              ]
          ),
        )
    );
  }
}
