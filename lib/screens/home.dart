import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics/screens/welcome.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../cubit_tutorial/screens/cubit_home.dart';
import '../tutorials/api_call.dart';
import '../tutorials/counts.dart';
import '../tutorials/visible.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bloc Concepts',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.purple, Colors.blue],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Get.to(() => CountsPge());
              },
              child: const Text('Counter'),
            ),
            MaterialButton(
              color: Colors.cyan,
              textColor: Colors.white,
              onPressed: () {
                Get.to(() => VisibleScreen());
              },
              child: const Text('Visible'),
            ),
            MaterialButton(
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                Get.to(() => ApiCall());
              },
              child: const Text('Api Handle'),
            ),

            MaterialButton(
              color: Colors.purple,
              textColor: Colors.white,
              onPressed: () {
                Get.to(() => WelcomeScreen());
              },
              child: const Text('Todo App'),
            ),
            MaterialButton(
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () {
                Get.to(() => CubitHome());
              },
              child: const Text('Cubit Tutorial'),
            ),
          ],
        ),
      ),
    );
  }
}
