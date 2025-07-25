import 'package:flutter/material.dart';
import 'package:shop/pages/Search_page.dart';
import 'package:shop/model/product.dart';
import 'package:shop/pages/details_page.dart';



class HomePage extends StatelessWidget {
  HomePage({super.key});
  final Product item = Product(
    name: "Air Force 1",
    price: "100",
    image: "images/AirForce1White.jpg",
    category: "Man's Shoe",
    rating: "4.5",
  );

  get icon => null;

  @override
  /// The homepage of the app, which displays a list of products.
  ///
  /// This page consists of a title, a search button, and a list of products.
  /// The products are displayed in a single column, with each product being a
  /// clickable card that navigates to the details page when tapped.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// The body of the page, which is a single column of widgets.
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// The title of the page, which is "Available Products".
            Container(
              margin: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Available Products",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  /// A search button that navigates to the search page.
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(20, 20),
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /// A list of products, each of which is a clickable card.
            /// When a product is tapped, it navigates to the details page.
            productInfo(context, item),
            productInfo(context, item),
            productInfo(context, item),
          ],
        ),
      ),
    );
  }

  /// A widget that displays a product's information in a clickable card.
  ///
  /// This widget takes a [BuildContext] and a [Product] as parameters.
  /// It returns a [GestureDetector] that displays the product's information
  /// and navigates to the details page when tapped.
  Widget productInfo(BuildContext context, Product item) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(item: item),
          ),
        );
      },
      child: item,
    );
  }
}