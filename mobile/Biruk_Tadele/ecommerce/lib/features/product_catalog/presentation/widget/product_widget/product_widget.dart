// import 'package:ecommerce/features/product_catalog/presentation/widget/widgets/rating.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/product.dart';
import '../widgets/rating.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});
  


  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 366,
      margin: const EdgeInsets.only(left: 32, right: 32, bottom: 16, top: 16),

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),

        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 366,
            height: 165,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              image: DecorationImage(
                image: NetworkImage(product.image),
                fit: BoxFit.fitHeight,
                alignment: const Alignment(0, 0.0),
              ),
            ),
    
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                

              ],
            ),
          ),

          const Row(
            children: [
              SizedBox(width: 16),
              StarToggle(),
              Text(
              '4.5',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 170, 164, 164),
                ),
              ),
            ],
          ),
            
        ],
      ),
    );
  }
}
