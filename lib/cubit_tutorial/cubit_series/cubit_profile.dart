import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit_logic.dart';
import '../cubits/cubit_state.dart';

class CubitProfile extends StatefulWidget {
  const CubitProfile({super.key});

  @override
  State<CubitProfile> createState() => _CubitProfileState();
}

class _CubitProfileState extends State<CubitProfile> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('build time ${context.read<CubitProfileLog>().state}');
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit Profile')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),

            BlocBuilder<CubitProfileLog, ProfileSate>(
              builder: (context, state) {
                if (state is ChangeName) {
                  return Text(state.name);
                }
                if (state is GenerateEmail) {
                  return Text(state.myEmail);
                }

                return const SizedBox();
              },
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter you name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CubitProfileLog>().changeMyName(
                      nameController.text,
                    );
                  },
                  child: const Text('Your Name'),
                ),

                ElevatedButton(
                  onPressed: () {
                    context.read<CubitProfileLog>().generateEmail();
                  },
                  child: const Text('Generate Email'),
                ),
              ],
            ),

            Text('BlocSelector'),
            BlocSelector<CubitProfileLog, ProfileSate, bool>(
              selector: (state) => state is ChangeName,
              builder: (context, state) {
                if (state) {
                  return Text(
                    'Your Name is ${nameController.text}',
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),



          ],
        ),
      ),
    );
  }
}
