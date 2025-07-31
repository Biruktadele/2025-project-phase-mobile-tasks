
import 'package:ecommerce/features/product_catalog/data/models/Product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductModel', () {
    const tProductModel = ProductModel(
      id: 123,
      name: 'Test Product',
      price: 99.99,
      description: 'A test product',
      image: 'http://image.url',
    );

    final tProductJson = {
      'id': 123,
      'name': 'Test Product',
      'price': 99.99,
      'description': 'A test product',
      'image': 'http://image.url',
    };

    final tExpectedJson = {
      'id': 123,
      'name': 'Test Product',
      'price': 99.99,
      'description': 'A test product',
      'image': 'http://image.url',
    };

    test('fromJson should return a valid ProductModel', () {
      final result = ProductModel.fromJson(tProductJson);
      expect(result, tProductModel);
    });

    test('toJson should return a valid JSON map', () {
      final result = tProductModel.toJson();
      expect(result, tExpectedJson);
    });
  });
}
