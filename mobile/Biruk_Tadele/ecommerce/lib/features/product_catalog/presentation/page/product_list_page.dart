import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';
import '../bloc/product_bloc.dart';
import '../widget/All_product_widgets/product_detail_navgiter.dart';
import '../widget/product_widget/tittel_bar.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TittelBar(),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  final List<Product> products = state.products;
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (_, index) =>
                        ProductDetailNavgiter(item: products[index]),
                  );
                } else if (state is ProductError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(
                    child: Text('Press the button to load products.'),
                  );
                }
              },
            ),
          ),
        
         
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProductBloc>().add(const LoadAllProductsEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
