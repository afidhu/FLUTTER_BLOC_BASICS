import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/node_post_bloc.dart';

class NodePostScreen extends StatefulWidget {
  const NodePostScreen({super.key});

  @override
  State<NodePostScreen> createState() => _NodePostScreenState();
}

class _NodePostScreenState extends State<NodePostScreen> {

   var imagePicked =''.obs;

  final globalKey =GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController userId = TextEditingController();


  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NodePostBloc>().add(GetNodePostEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(" Post Bloc Clean Architecture"),

      ),
      body: Center(
        child: Container(
          child: BlocBuilder<NodePostBloc,NodePostState>(
              builder: (context, state){
                if(state is NodePostLoading){
                  return const Center(child: CircularProgressIndicator(),);
                }
                else if(state is NodePostLoadingError) {
                  return Center(child: Text(state.error),);
                }
                else if(state is NodePostLoaded){
                  return ListView.builder(
                      itemCount: state.nodePosts.length,
                      itemBuilder: (context, index){
                        var data = state.nodePosts[index];
                        return Card(
                            child: ListTile(
                              title:Text(data.title.toString()) ,
                              leading: CircleAvatar(
                                child: Text('${index+1}'),
                              ),
                              trailing: Image.network(data.imageUrl.toString()),
                            )
                        );
                      }
                  );
                }
                return SizedBox();
              }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            _bottomSheet();
          }
      ),
    );

  }

  Future<dynamic> _bottomSheet() async{
    return Get.bottomSheet(
      isScrollControlled: true,
      Container(
       margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 18,),
            Form(
              key: globalKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white10,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red),
                  )
                ),
                controller: title,
                validator: (val){
                  if(val.toString().isEmpty){
                    return 'Please enter title';
                  }
                  return null;
                },
                style: TextStyle(
                  color: Colors.black
                ),
              ),
                  SizedBox(height: 10,),

                           TextFormField(
                             controller: content,
                decoration: InputDecoration(
                  fillColor: Colors.white10,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red),
                  )
                ),
                validator: (val){
                  if(val.toString().isEmpty){
                    return 'Please enter content';
                  }
                  return null;
                },
                style: TextStyle(
                  color: Colors.black
                ),
              ),
                  SizedBox(height: 10,),

                           TextFormField(
                             controller: userId,
                decoration: InputDecoration(
                  fillColor: Colors.white10,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red),
                  )
                ),
                validator: (val){
                  if(val.toString().isEmpty) {
                    return 'Please enter user Id';
                  }
                    return null;
                },
                style: TextStyle(
                  color: Colors.black
                ),
              ),
                  SizedBox(height: 10,),

                  if(imagePicked.isNotEmpty)
                 SizedBox(
                   height: 100,
                   width: 100,
                   child: FittedBox(
                     child: Obx(()=> Image.file(File(imagePicked.value)))
                   )

                 ),

                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)
                    ),
                      onPressed: (){
                        imagesPicker();
                      },
                      child: Icon(Icons.image_outlined,color: Colors.white,size: 30,)
                  ),
                  SizedBox(height: 10,),



            ],)),
            ElevatedButton(
              onPressed: (){
                if(globalKey.currentState!.validate()){
                context.read<NodePostBloc>().add(AddNodePostEvent(title: title.text, content: content.text, userId: 1, imagePath: imagePicked.value));
                }
                else{
                  print('all fields are required');
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
      )
    );
  }


  Future<void> imagesPicker() async{
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
// Capture a photo.
//     final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    imagePicked.value = image!.path;
  }

}

