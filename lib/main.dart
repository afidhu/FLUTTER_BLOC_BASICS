import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basics/screens/home.dart';
import 'package:flutter_bloc_basics/tutorials/counts.dart';
import 'package:flutter_bloc_basics/tutorials/todo_app/blocTodo/todo_logic/todoLogics.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'bloc_logic/api_product_logic.dart';
import 'bloc_logic/count_bloc.dart';
import 'bloc_logic/visibility_logic.dart';
import 'cubit_tutorial/bloc/my_observer.dart';
import 'cubit_tutorial/cubits/cubit_logic.dart';
import 'data/model/product_model.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>('productBox');
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CountBloc()),
          BlocProvider(create: (_) => VisibleBloc()),
          BlocProvider(create: (_) => ProductBloc()),
          BlocProvider(create: (_) => TodoBloc()),
          BlocProvider(create: (_) => CubitProfileLog()),
          BlocProvider(create: (_) => ImagePickerCubit()),
        ],
          child: GetMaterialApp(
            home: HomeScreen(),
          ),
      )
  );
  /////this is for cubit and bloc observer For debugging only and other work
  Bloc.observer =MyObserver();
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home:  HomeScreen(),
//     );
//   }
// }
