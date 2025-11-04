import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basics/bloc_events/visibility_event.dart';

import '../bloc_logic/visibility_logic.dart';
import '../bloc_state/visibility_state.dart';

class VisibleScreen extends StatefulWidget {
  const VisibleScreen({super.key});

  @override
  State<VisibleScreen> createState() => _VisibleScreenState();
}

class _VisibleScreenState extends State<VisibleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visible Screen'),

      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<VisibleBloc,VisibilityState>(
              builder: ( context, state) {
                return Visibility(
                    visible: state.is_visible,
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.red,
                    )
                );
              }
            ),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green)
              ),
                onPressed: (){
                context.read<VisibleBloc>().add(ShowVisibleEvent());
                },
                child: Text('Show')
            ),
            ElevatedButton(

              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red)
              ),
                onPressed: (){
                  context.read<VisibleBloc>().add(HideVisibleEvent());
                },
                child: Text('hide')
            ),
          ],
        ),
      ),
    );
  }
}
