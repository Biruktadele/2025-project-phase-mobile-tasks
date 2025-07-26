import 'package:flutter/material.dart';
import 'package:shop/model/product.dart';
import 'package:shop/pages/add_page.dart';
import 'package:shop/widgets/rating.dart';
import 'package:shop/widgets/Size.dart';


class DetailsPage extends StatefulWidget {
  final Product item;
  const DetailsPage({required this.item , super.key});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

// final Product item =  Product(
//       name: "Air Force 1",
//       price: "100",
//       image: "images/AirForce1White.jpg",
//       category: "Man's Shoe",
//       rating: "4.5",
//       description: "Step into a legend. The Nike Air Force 1 blends classic style with modern comfort, delivering a clean, versatile look that never goes out of fashion. With its smooth leather upper, signature perforations, and cushioned Air-Sole unit, the AF1 offers everyday durability and all-day support. Whether you're hitting the streets or elevating your outfit, this sneaker speaks confidence and culture.",
//     );
class _DetailsPageState extends State<DetailsPage> {
  @override
  /// Details page for a product.
  ///
  /// This page contains the details of a product which includes the product
  /// name, price, category, rating, and description. It also contains a
  /// number selector for selecting the desired size of the product.
  ///
  /// The page is designed to be responsive and will adapt to different screen
  /// sizes.
  @override
  Widget build(BuildContext context) {
    List<Product> res = [widget.item];
    
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product image
            Container(
              width: 480,
              height: 266,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(res[0].image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.only(left: 7),
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context , res[0]);
                        },
                        icon: Icon(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                children: [
                  // Category
                  Text(
                    res[0].category,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 170, 164, 164),
                    ),
                  ),
                  Spacer(),
                  // Rating
                  StarToggle(),
                  Text(
                    "(${res[0].rating})",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 170, 164, 164),
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
                    res[0].name,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  // Price
                  Text(
                    "\$${res[0].price}",
                    style: TextStyle(
                      fontFamily: "Poppins",
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
              child: Text(
                "Size:",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            NumberSelector(),
            // Product description
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 16),
              child: Text(
                res[0].description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 170, 164, 164),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Delete and update buttons
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  // Delete button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text("Delete"),
                    ),
                  ),
                  SizedBox(width: 26),
                  // Update button
                  Expanded(
                    child: OutlinedButton(
                          onPressed: () async {
                            Product result = await Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 500),
                                pageBuilder: (_, __, ___) => AddPage(item: res[0]),
                                transitionsBuilder: (_, animation, __, child) {
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: Offset(1.0, 0.0), // Slide from right
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  );
                                },
                              ),
                            );

                            setState(() {
                              res[0] = result;
                            });

                            Navigator.pop(context, res[0]);
                          },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text("Update"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
