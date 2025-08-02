import 'dart:convert';

import 'package:ecommerce/features/product_catalog/data/datasources/local_data/product_local_data_source_impl.dart';
import 'package:ecommerce/features/product_catalog/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../mocks/mock_shared_preferences.mocks.dart';

void main() {
  late ProductLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockPrefs;

  const tProduct = ProductModel(
    id: 1,
    name: 'Test Product',
    price: 9.99,
    description: 'Description',
    image: 'image.png',
  );

  setUp(() {
    mockPrefs = MockSharedPreferences();
    dataSource = ProductLocalDataSourceImpl(sharedPreferences: mockPrefs);
  });

  group('cacheProduct', () {
    test('should save product as JSON in shared preferences', () async {
      // arrange
      final expectedJson = jsonEncode(tProduct.toJson());
      when(mockPrefs.setString(any, any)).thenAnswer((_) async => true);

      // act
      await dataSource.cacheProduct(tProduct);

      // assert
      verify(mockPrefs.setString('CACHED_PRODUCT_${tProduct.id}', expectedJson));
    });
  });

  group('getCachedProduct', () {
    test('should return cached product if present', () async {
      // arrange
      final jsonString = jsonEncode(tProduct.toJson());
      when(mockPrefs.getString('CACHED_PRODUCT_${tProduct.id}')).thenReturn(jsonString);

      // act
      final result = await dataSource.getCachedProduct(tProduct.id);

      // assert
      expect(result, equals(tProduct));
    });

    test('should throw Exception when no cached product found', () async {
      // arrange
      when(mockPrefs.getString(any)).thenReturn(null);

      // act
      final call = dataSource.getCachedProduct;

      // assert
      expect(() => call(tProduct.id), throwsException);
    });
  });

  group('cacheProducts & getCachedProducts', () {
    test('should cache and retrieve list of products', () async {
      // arrange
      final productList = [tProduct, tProduct];
      final encoded = jsonEncode(productList.map((p) => p.toJson()).toList());

      when(mockPrefs.setString(any, any)).thenAnswer((_) async => true);
      when(mockPrefs.getString('CACHED_PRODUCTS')).thenReturn(encoded);

      // act
      await dataSource.cacheProducts(productList);
      final result = await dataSource.getCachedProducts();

      // assert
      expect(result.length, 2);
      expect(result[0], equals(tProduct));
    });
  });

  group('removeCachedProduct', () {
    test('should remove product from cache', () async {
      // arrange
      when(mockPrefs.remove(any)).thenAnswer((_) async => true);

      // act
      await dataSource.removeCachedProduct(tProduct.id);

      // assert
      verify(mockPrefs.remove('CACHED_PRODUCT_${tProduct.id}'));
    });
  });
}
