import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../widget/All_product_widgets/all_product.dart';
import '../widget/product_widget/tittel_bar.dart';

class RetrieveAllProductsPage extends StatefulWidget {
  const RetrieveAllProductsPage({super.key});

  @override
  State<RetrieveAllProductsPage> createState() => _RetrieveAllProductsPageState();
}

class _RetrieveAllProductsPageState extends State<RetrieveAllProductsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
          children: [
            TittelBar(),
            AllProductsPage(),
          ],
        ),
    
   
    
    floatingActionButton: Transform.translate(
  offset: const Offset(0, -60), // X: 0 (no left/right), Y: -20 (move up)
  child: FloatingActionButton(
    onPressed: () {
      context.read<ProductBloc>().add(const LoadAllProductsEvent());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Products loaded successfully')),
      );
    },
    shape: const CircleBorder(),
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,

    child: const Icon(Icons.refresh),
  ),
),
  );
  }
}
