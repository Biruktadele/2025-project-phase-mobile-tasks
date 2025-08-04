import 'package:flutter/material.dart';
import '../../../domain/entities/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Image.network(product.image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(product.name),
        subtitle: Text(product.description),
        trailing: Text('\$${product.price.toStringAsFixed(2)}'),
      ),
    );
  }
}
