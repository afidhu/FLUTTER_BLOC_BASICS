import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../features/posts/presentation/screen/posts_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Bloc Clean Architecture"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            InkWell(
              // onTap: (){},
              child: FloatingActionButton(
                  onPressed:(){
                    Get.to(()=>PostsScreen());
                  },
                child: Text('Posts'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
