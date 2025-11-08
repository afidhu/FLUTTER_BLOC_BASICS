import 'package:flutter/material.dart';
import 'package:flutter_chat_bloc/core/theme_colors.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Messages',
          style: TextStyle(color: AppColors.appBarTitle),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.appBarBackground,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Column(
        children: [
          // Horizontal Users List
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: CircleAvatar(),
                  title: Text("User Name"),
                  subtitle: Text("Last message..."),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
