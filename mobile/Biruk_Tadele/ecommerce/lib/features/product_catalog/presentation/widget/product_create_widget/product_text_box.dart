import 'package:flutter/material.dart';

class ProductInput extends StatelessWidget {
  final TextEditingController priceController;
  final String hintText;
  final String label;
  const ProductInput({super.key, required this.priceController , required this.hintText , required this.label});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 88, 90, 92),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: hintText,
          ),
          controller: priceController,
        ),
      ],
    );
  }
}
 