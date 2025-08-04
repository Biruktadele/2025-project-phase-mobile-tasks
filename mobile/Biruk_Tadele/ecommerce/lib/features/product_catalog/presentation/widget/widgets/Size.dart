import 'package:flutter/material.dart';

class NumberSelector extends StatefulWidget {
  const NumberSelector({super.key});

  @override
  _NumberSelectorState createState() => _NumberSelectorState();
}

/// A horizontal [ListView] of numbers from 39 to 58, with the
/// selected number highlighted in blue.
class _NumberSelectorState extends State<NumberSelector> {
  /// The currently selected number, defaulting to 41.
  int _selectedNumber = 41;

  /// A list of numbers from 39 to 48.
  final List<int> _numbers = List.generate(10, (index) => 39 + index);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _numbers.length,
        itemBuilder: (context, index) {
          final number = _numbers[index];
          final isSelected = number == _selectedNumber;

          return GestureDetector(
            /// When the number is tapped, update the selected number.
            onTap: () {
              setState(() {
                _selectedNumber = number;
              });
            },
            child: Container(
              width: 60,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                /// The background color of the selected item is blue.
                color: isSelected ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  /// The border color of the selected item is blue, otherwise
                  /// it is a light grey.
                  color: isSelected ? Colors.blue : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                /// The number as a string.
                '$number',
                style: TextStyle(
                  /// The color of the text is white if the item is selected,
                  /// otherwise it is black.
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
