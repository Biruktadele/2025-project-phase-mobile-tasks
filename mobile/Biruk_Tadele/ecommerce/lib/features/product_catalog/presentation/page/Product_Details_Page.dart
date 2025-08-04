
import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import '../widget/widgets/Size.dart';
import '../widget/widgets/rating.dart';

import 'create_product_page.dart';


// ignore: must_be_immutable
class ProductDetailsPage extends StatefulWidget {
  Product item;
  ProductDetailsPage({required this.item , super.key});
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}


class _ProductDetailsPageState extends State<ProductDetailsPage> {

  @override
  Widget build(BuildContext context) {

    
    
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product image
            Container(
              width: 280,
              height: 366,
              
              margin: const EdgeInsets.only(top:36.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.item.image),
                  fit: BoxFit.cover,
                 
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                   
                    left: -20,
                    child: Container(
                      padding: const EdgeInsets.only(left: 7),
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context , widget.item);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.blue,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Product information
           const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                children: [
                  // Category
                
                  Spacer(),
                  // Rating
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
            ),
            // Product name and price
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  // Product name
                  Text(
                    widget.item.name,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  // Price
                  Text(
                    '\$${widget.item.price}',
                    style: const  TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Size selector
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              alignment: Alignment.topLeft,
              child: const Text(
                'Size:',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const NumberSelector(),
            // Product description
           Container(
              margin: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 16),
              child: Text( 
                widget.item.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 170, 164, 164),
                ),
              ),
            ),
           const  SizedBox(height: 10),
            // Delete and update buttons
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  // Delete button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Delete'),
                    ),
                  ),
                  const SizedBox(width: 26),
                  // Update button
                  Expanded(
                    child: OutlinedButton(
                          onPressed: () async {
                            Product result = await Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(milliseconds: 500),
                                pageBuilder: (_, _, _) => const CreateProductPage(),
                                transitionsBuilder: (_, animation, _, child) {
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(1.0, 0.0), // Slide from right
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  );
                                },
                              ),
                            );

                            setState(() {
                              widget.item = result;
                            });

                            // ignore: use_build_context_synchronously
                            Navigator.pop(context, widget.item);
                          },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Update'),
                    ),
                  ),
                 
                ],
              ),
            ),
             const SizedBox(height: 46),
          ],
        ),
      ),
    );
  }
}
