import 'package:flutter/material.dart';

class price_bar extends StatefulWidget {
  const price_bar({super.key});

  @override
  State<price_bar> createState() => _price_barState();
}

class _price_barState extends State<price_bar> {
  RangeValues _currentRangeValues = const RangeValues(0 , 100);

  @override
  /// Builds the price range slider widget.
Widget build(BuildContext context) {
  // Extract the start and end values of the current range.
  final minPrice = _currentRangeValues.start;
  final maxPrice = _currentRangeValues.end;

  // Return a RangeSlider widget with the specified properties.
  return RangeSlider(
    values: _currentRangeValues,
    min: 0,
    max: 100,
    divisions: 10,
    activeColor: Colors.blue,
    inactiveColor: Colors.grey.shade300,
    // Update the range values when the slider changes.
    onChanged: (RangeValues newValues) {
      setState(() {
        _currentRangeValues = newValues;
      });
    },
    // Display labels showing the current range values.
    labels: RangeLabels(
      '\$${minPrice.round().toString()}',
      '\$${maxPrice.round().toString()}',
    ),
  );
}
}
