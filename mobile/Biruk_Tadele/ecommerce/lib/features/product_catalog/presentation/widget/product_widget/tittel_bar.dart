import 'package:flutter/material.dart';

import '../All_product_widgets/add_product_button.dart';

  
class TittelBar extends StatelessWidget {
  const TittelBar({super.key}) ;


  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.all(16),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Available Products',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),

                  /// A search button that navigates to the search page.
                  AddProductButton(),
                ],
              ),
            );
  }
}