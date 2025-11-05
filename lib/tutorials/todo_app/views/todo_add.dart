import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../blocTodo/todo_events/todoEvents.dart';
import '../blocTodo/todo_logic/todoLogics.dart';
import '../blocTodo/todo_state/todoStates.dart';

class TodoAddScreen extends StatefulWidget {
  const TodoAddScreen({super.key});

  @override
  State<TodoAddScreen> createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TodoBloc>().add(TodoFetch());
  }
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      centerTitle: true,
      ),
      body: Center(
        child: RefreshIndicator(
            child: BlocBuilder<TodoBloc, TodoState>(
                builder: (context,state){
                  if(state is TodoLoading) {
                    return const CircularProgressIndicator();
                  }
                  else if( state is TodoError){
                    return Text(state.errorMessage);
                  }
                  // else if (state is TodoSuccess){
                  //
                  //    Get.snackbar('Success', 'message');
                  //    return ;
                  //
                  // }
                 else if( state is TodoData){
                    if(state.todos.isNotEmpty){
                   return  ListView.builder(
                     itemCount: state.todos.length,
                       itemBuilder: (context, index){
                       var data = state.todos[index];

                         return Card(
                           child: ListTile(
                             leading: CircleAvatar(),
                             title: Text(data.title.toString()),
                             subtitle: Text(data.description.toString()),
                           ),
                         );
                       }
                   );
                    }
                    else{
                      return  Text('No Data');
                    }
                 }

                  return const SizedBox();
                }
            ),

            onRefresh: () async{
              setState(() {
                context.read<TodoBloc>().add(TodoFetch());
              });
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){

            Get.bottomSheet(
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text('Fill ALL'),
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),
                    TextFormField(
                      controller: priceController,
                      decoration: InputDecoration(
                        hintText: 'Price',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      context.read<TodoBloc>().add(TodoAdd(title: titleController.text, price: double.parse(priceController.text), description: descriptionController.text,));
                      Get.back();
                      titleController.clear();
                      priceController.clear();
                      descriptionController.clear();
                    }, child: Text('Add'))
                  ],
                ),
              )
            );

          },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
