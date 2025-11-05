import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics/tutorials/todo_app/auth/register.dart';
import 'package:get/get.dart';

import '../views/todo_add.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),

      body: Center(
        child: Column(
          children: [
            Text('Login Now!!', style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, fontSize: 30), ),

            Container(
              margin: EdgeInsets.all(20),
              child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Enter Email',
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {

                          if(GetUtils.isEmail(value!)){
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          }else{
                            return 'Please enter a valid email';
                          }
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Enter Password',
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (value) {


                            if (value!.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          }

                      ),
                    ],
                  )
              ),
            ),

            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyanAccent),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )),
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    Get.to(()=>TodoAddScreen());
                  }
                },
                child: Text('Login!!')
            ),
            RawChip(
              onPressed: (){
                Get.to(()=>RegisterScreen());
              },
                label: Text('Register Account')
            )
          ],
        ),
      ),
    );
  }
}
