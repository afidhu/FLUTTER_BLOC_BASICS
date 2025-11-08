import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit_logic.dart';
import '../cubits/cubit_state.dart';

class EQUATABLE extends StatefulWidget {
  const EQUATABLE({super.key});

  @override
  State<EQUATABLE> createState() => _EQUATABLEState();
}

class _EQUATABLEState extends State<EQUATABLE> {
  final _cubtEquatable =WithoutRequatable();
  @override
  Widget build(BuildContext context) {
    print('build_cubtEquatable: ${_cubtEquatable.equatableBool.runtimeType}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('EQUATABLE'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<WithoutRequatable, bool>(
              buildWhen: (previous, current) => previous != current,
              bloc: _cubtEquatable,
              builder: (context, state) {
                return Text(
                  _cubtEquatable.state.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                );
              },
            ),

            ElevatedButton(
              onPressed: () =>
                  _cubtEquatable.equatableBool(),
              child: const Text('Is Requatable'),
            ),

            SizedBox(height: 30),


          ],
        ),
      ),
    );
  }
}
