import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final void Function() onSubmit;
  const AddButton({super.key , required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSubmit,
      style: ElevatedButton.styleFrom(
        // minimumSize: const Size(350, 50),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text('Add'),
    );
  }
}

