import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit_logic.dart';
import '../cubits/cubit_state.dart';

class CubitImagePicker extends StatefulWidget {
  const CubitImagePicker({super.key});

  @override
  State<CubitImagePicker> createState() => _CubitImagePickerState();
}

class _CubitImagePickerState extends State<CubitImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<ImagePickerCubit,ImagePickerState>(
                builder: (context,state){
                  if(state is imagePickerLoading){
                    return const Center(child: CircularProgressIndicator());
                  }
                  else if(state is imageLoadedSuccess){
                    return FittedBox(
                      fit: BoxFit.cover,
                      child: Image.file(File(state.imageUrl)),
                    );
                  }
                  else if(state is imageLoadedFailure){
                    return Text(state.error);
                  }

                  return SizedBox();
                }
            ),

            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: (){
                  context.read<ImagePickerCubit>().pickImages();
                },
                child:  Text('Pick Image'),
            )

          ],
      ),
    ));
  }
}
