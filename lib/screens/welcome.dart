import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../tutorials/todo_app/auth/login.dart';
import '../tutorials/todo_app/auth/register.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
                aspectRatio: 12/9,
              child: Image.asset('images/img.png'),
            ),
            const SizedBox(height: 30,),
            FilledButton(
                onPressed: (){
                  Get.to(()=>LoginScreen());
                },
                child:Text('Get Started')
            )
            ]
        ),
      ),
    );
  }
}
