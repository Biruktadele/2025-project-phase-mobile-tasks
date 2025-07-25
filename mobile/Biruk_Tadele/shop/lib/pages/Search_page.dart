import 'package:flutter/material.dart';
import 'package:shop/model/product.dart';
import 'package:shop/widgets/pricebar.dart';

final Product item = Product(
  name: "Air Force 1",
  price: "100",
  image: "images/AirForce1White.jpg",
  category: "Man's Shoe",
  rating: "4.5",
);

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
            size: 25,
          ),
        ),
        title: Text(
          "Search Page",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _categoryRow(),
            item,
            _productCard(),
            _searchForm(),
          ],
        ),
      ),
    );
  }

  Widget _categoryRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _categoryBox(),
        _menuButton(),
      ],
    );
  }

  Widget _categoryBox() {
    return Container(
      margin: EdgeInsets.only(left: 40, top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Text(
            'Leather',
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          SizedBox(width: 146),
          Icon(Icons.arrow_forward, color: Colors.blue),
        ],
      ),
    );
  }

  Widget _menuButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(right: 16, top: 20),
      padding: EdgeInsets.all(12),
      child: Icon(Icons.menu, color: Colors.white, size: 20),
    );
  }

  Widget _productCard() {
    return Container(
      margin: EdgeInsets.only(top: 12, left: 28, right: 28),
      height: 42,
      width: 366,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
        image: DecorationImage(
          image: AssetImage(item.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _searchForm() {
    return Container(
      color: Colors.white,
      height: 272,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 20),
            child: Text("Category", style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 5),
            child: SizedBox(
              height: 42,
              width: 366,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 5),
            child: Text("Price", style: TextStyle(fontSize: 18)),
          ),
          price_bar(),
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 5),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Search"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(320, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
