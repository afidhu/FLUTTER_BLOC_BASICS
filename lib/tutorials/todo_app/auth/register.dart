import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),

      body: Center(
        child: Column(
          children: [
            Text('Create an Account', style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, fontSize: 30), ),

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
                          if (value == null || value.isEmpty) {
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
                    Get.to(()=>LoginScreen());
                  }
                },
                child: Text('Create!!')
            )
          ],
        ),
      ),
    );
  }
}
