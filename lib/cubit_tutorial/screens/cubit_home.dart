import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../cubit_series/cubit_count.dart';
import '../cubit_series/cubit_image.dart';
import '../cubit_series/cubit_profile.dart';
import '../cubit_series/equatablePgae.dart';
import '../cubits/equatable_.dart';

class CubitHome extends StatefulWidget {
  const CubitHome({super.key});

  @override
  State<CubitHome> createState() => _CubitHomeState();
}

class _CubitHomeState extends State<CubitHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () {
                Get.to(() => CubitCount());
              },
              child: const Text('Cubit Bloc Count'),
            ),

            MaterialButton(
              color: Colors.purple,
              textColor: Colors.white,
              onPressed: () {
                Get.to(() => CubitProfile());
              },
              child: const Text('Cubit Bloc Profile'),
            ),
        MaterialButton(
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                Get.to(() => EQUATABLE());
              },
              child: const Text('Cubit Bloc PEQUATABLE'),
            ),MaterialButton(
              color: Colors.pinkAccent,
              textColor: Colors.white,
              onPressed: () {
                Get.to(() => CubitImagePicker());
              },
              child: const Text('Cubit  Image picker'),
            ),

          ],

        ),
      ),
    );
  }
}
