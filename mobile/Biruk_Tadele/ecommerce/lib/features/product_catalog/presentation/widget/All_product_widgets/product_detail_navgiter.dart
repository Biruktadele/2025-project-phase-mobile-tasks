import 'package:flutter/material.dart';

import '../../../domain/entities/product.dart';
import '../../page/Product_Details_Page.dart';
import '../product_widget/product_widget.dart';

class ProductDetailNavgiter extends StatelessWidget {
  final Product item;
  const ProductDetailNavgiter({super.key , required this.item});



  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                ProductDetailsPage(item: item),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          ),
        );
      },
      child: ProductWidget(product: item),
    );
  }
}