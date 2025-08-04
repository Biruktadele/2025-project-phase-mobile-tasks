import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/product_catalog/presentation/bloc/product_bloc.dart';
import 'features/product_catalog/presentation/page/Home_Page.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (_) => di.sl<ProductBloc>(),
      child: const MaterialApp(
        title: 'Ecommerce',
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
