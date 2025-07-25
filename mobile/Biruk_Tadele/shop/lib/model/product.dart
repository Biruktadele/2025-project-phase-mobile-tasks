import 'package:flutter/material.dart';
import 'package:shop/widgets/rating.dart';
/// A widget for displaying a product in a card.
///
/// The product is displayed with a name, price, category, and rating. The
/// widget also includes a star toggle button.
///
/// The product information is displayed in a column with the name and price
/// aligned to the left, and the category and rating aligned to the right. The
/// star toggle button is displayed to the right of the rating.
///
/// The widget is designed to be used in a horizontal scrollable list of
/// products.
class Product extends StatelessWidget {

  final String name;
  final String price;
  final String image;
  final String category;
  final String rating;

  const Product({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 366,
      margin: EdgeInsets.only(left: 32, right: 32, bottom: 16, top: 16),

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),

        borderRadius: BorderRadius.circular(16),
        boxShadow: [
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
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
                alignment: Alignment(0, 0.2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
            child: Row(
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 120),
                Text(
                  "\$$price",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              SizedBox(width: 16),
              Text(
                category,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 170, 164, 164),
                ),
              ),
              SizedBox(width: 140),
              StarToggle(),
              Text(
                "($rating)",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 170, 164, 164),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
