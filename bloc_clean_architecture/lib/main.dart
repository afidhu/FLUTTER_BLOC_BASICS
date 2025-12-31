import 'package:bloc_clean_architecture/config/themes/app_themes.dart';
import 'package:bloc_clean_architecture/core/screens/home_screen.dart';
import 'package:bloc_clean_architecture/features/posts/data/data_source/remote/poduct_remote_data.dart';
import 'package:bloc_clean_architecture/features/posts/data/repository_impl/posts_repo_impl.dart';
import 'package:bloc_clean_architecture/features/posts/domain/repository/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/carts/data/cart_repo_impl/cart_repo_impl.dart';
import 'features/carts/data/carts_data_sources/remote/cart_remote_datasource.dart';
import 'features/carts/domain/repository/carts_repository.dart';
import 'features/carts/domain/usecases/cart_usecase.dart';
import 'features/carts/presentation/bloc/cart_bloc.dart';
import 'features/posts/domain/usecases/get_post_usecase.dart';
import 'features/posts/presentation/bloc/posts_bloc.dart';
import 'features/products/data/product_repo_impl/local_product_repo_impl.dart';
import 'features/products/data/product_repo_impl/products_repo_impl.dart';
import 'features/products/data/product_source_data/remote/product_source.dart';
import 'features/products/domain/repository/product_repository.dart';
import 'features/products/domain/usecase/product_usecase.dart';
import 'features/products/presentation/bloc/products_bloc.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter('productHive');
 await Hive.openBox('productsBox');

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PostRepository>(create: (_) => PostRepositoryImpl(ProductDataSource()),),
        RepositoryProvider<ProductRepository>(create: (_) => ProductRepositoryImpl(ProductsRemoteSourceData()),),
        RepositoryProvider<ProductRepository>(create: (_) => LocalProductsRepositoryImpl(Hive.box('productsBox')),),
        RepositoryProvider<CartRepository>(create: (_) => CartRepositoryImpl(CartRemoteDataSource()),),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PostsBloc>(create: (context) =>PostsBloc(GetPostUseCase(context.read<PostRepository>())),),
          BlocProvider<ProductsBloc>(create: (context) =>ProductsBloc(GetProductUseCase(context.read<ProductRepository>())),),
          BlocProvider<CartBloc>(create: (context) =>CartBloc(GetCartUseCase(context.read<CartRepository>())),),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          home: HomeScreen(),
        ),
      ),
    ),
  );
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//
//       theme: AppTheme.light,
//       darkTheme: AppTheme.dark,
//       themeMode: ThemeMode.system,
//       // theme: ThemeData(
//       //   // This is the theme of your application.
//       //   //
//       //   // TRY THIS: Try running your application with "flutter run". You'll see
//       //   // the application has a purple toolbar. Then, without quitting the app,
//       //   // try changing the seedColor in the colorScheme below to Colors.green
//       //   // and then invoke "hot reload" (save your changes or press the "hot
//       //   // reload" button in a Flutter-supported IDE, or press "r" if you used
//       //   // the command line to start the app).
//       //   //
//       //   // Notice that the counter didn't reset back to zero; the application
//       //   // state is not lost during the reload. To reset the state, use hot
//       //   // restart instead.
//       //   //
//       //   // This works for code too, not just values: Most code changes can be
//       //   // tested with just a hot reload.
//       //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       // ),
//       home: const HomeScreen()
//     );
//   }
// }