import 'package:flutter/material.dart';
class NameInput extends StatelessWidget {
  final TextEditingController nameController;
  const NameInput({super.key , required this.nameController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Name',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 88, 90, 92),
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: 'Product Name',
            ),
          ),
        ],
      ),
    );
  }
}