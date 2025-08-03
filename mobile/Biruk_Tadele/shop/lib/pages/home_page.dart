import 'package:flutter/material.dart';
import 'package:shop/pages/Search_page.dart';
import 'package:shop/model/product.dart';
import 'package:shop/pages/add_page.dart';
import 'package:shop/pages/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> res = [
    Product(
      name: "Air Force 1",
      price: "100",
      image: "images/AirForce1White.jpg",
      category: "Man's Shoe",
      rating: "4.5",
      description:
          "Step into a legend. The Nike Air Force 1 blends classic style with modern comfort, delivering a clean, versatile look that never goes out of fashion. With its smooth leather upper, signature perforations, and cushioned Air-Sole unit, the AF1 offers everyday durability and all-day support. Whether you're hitting the streets or elevating your outfit, this sneaker speaks confidence and culture.",
    ),
  ];
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
                            builder: (context) => SearchPage(item: res[0]),
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
            productInfo(context, res[0]),
            productInfo(context, res[0]),
            productInfo(context, res[0]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: () async {
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => AddPage(item: res[0]),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
    setState(() {
      res[0] = result;
    });
  },
  shape: const CircleBorder(),
  backgroundColor: Colors.blue,
  child: const Icon(
    Icons.add,
    color: Colors.white,
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
  onTap: () async {
    final result = await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) =>
            DetailsPage(item: item),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );

    if (result != null) {
      setState(() {
        res[0] = result;
      });
    }
  },
  child: res[0],
);
  }
}
