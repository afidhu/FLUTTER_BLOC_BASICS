import 'package:flutter/material.dart';
import 'package:flutter_chat_bloc/core/theme_colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final dateNow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: const Text(
          'Messages',
          style: TextStyle(color: AppColors.appBarTitle),
        ),
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     gradient: AppColors.appBarBackground,
        //   ),
        // ),
        // backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Column(
        children: [
          // Horizontal Users List
          Text('Recent Users'),
          SizedBox(
            height: Get.height * 0.13,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blueAccent,
                      ),
                      SizedBox(height: 6),
                      Text("User", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Example chat list area
          _widgetUerList()
        ],
      ),
    );
  }


  Widget _widgetUerList(){
    return   Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return  ListTile(
                leading: CircleAvatar(),
                title: Text("User Name"),
                subtitle: Text("Last message..."),
                trailing: Text(dateNow.toString().substring(11, 16))
            );
          },
        ),
      ),
    );
  }
}
