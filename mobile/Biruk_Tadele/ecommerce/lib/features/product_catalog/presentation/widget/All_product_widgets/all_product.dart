import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product.dart';
import '../../bloc/product_bloc.dart';
import 'product_detail_navgiter.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            final List<Product> products = state.products;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, index) => ProductDetailNavgiter(item: products[index]),
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Press the button to load products.'));
          }
        },
    );
    
  }
}
