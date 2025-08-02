import 'dart:convert';

import 'package:ecommerce/core/constants/api_constant.dart';
import 'package:ecommerce/features/product_catalog/data/datasources/remote_data/product_remote_data_source_impl.dart';
import 'package:ecommerce/features/product_catalog/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../../mocks/mock_http_client.mocks.dart';

void main() {
  late ProductRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  const testProductModel = ProductModel(
    id: 1,
    name: 'Test Product',
    price: 9.99,
    description: 'Test Description',
    image: 'test.jpg',
  );

  final testProductList = [testProductModel];

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = ProductRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getAllProducts', () {
    test('should return a list of products when the response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/products')))
          .thenAnswer((_) async => http.Response(jsonEncode([testProductModel.toJson()]), 200));

      // act
      final result = await dataSource.getAllProducts();

      // assert
      expect(result, equals(testProductList));
    });

    test('should throw an Exception when the response code is not 200', () async {
      when(mockHttpClient.get(Uri.parse('$baseUrl/products')))
          .thenAnswer((_) async => http.Response('Error', 404));

      expect(() => dataSource.getAllProducts(), throwsException);
    });
  });

  group('getProductById', () {
    test('should return a product when the response is 200', () async {
      when(mockHttpClient.get(Uri.parse('$baseUrl/products/1')))
          .thenAnswer((_) async => http.Response(jsonEncode(testProductModel.toJson()), 200));

      final result = await dataSource.getProductById(1);

      expect(result, equals(testProductModel));
    });

    test('should throw an Exception when the product is not found', () async {
      when(mockHttpClient.get(Uri.parse('$baseUrl/products/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => dataSource.getProductById(1), throwsException);
    });
  });

  group('addProduct', () {
    test('should send a POST request and succeed on 201', () async {
      when(mockHttpClient.post(
        Uri.parse('$baseUrl/products'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('', 201));

      await dataSource.addProduct(testProductModel);
      verify(mockHttpClient.post(
        Uri.parse('$baseUrl/products'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(testProductModel.toJson()),
      ));
    });

    test('should throw an Exception if the response is not 201', () async {
      when(mockHttpClient.post(any, headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('Error', 400));

      expect(() => dataSource.addProduct(testProductModel), throwsException);
    });
  });

  group('updateProduct', () {
    test('should send a PUT request and succeed on 200', () async {
      when(mockHttpClient.put(
        Uri.parse('$baseUrl/products/1'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('', 200));

      await dataSource.updateProduct(testProductModel);
      verify(mockHttpClient.put(
        Uri.parse('$baseUrl/products/1'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(testProductModel.toJson()),
      ));
    });

    test('should throw an Exception if the response is not 200', () async {
      when(mockHttpClient.put(any, headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('Error', 400));

      expect(() => dataSource.updateProduct(testProductModel), throwsException);
    });
  });

  group('deleteProduct', () {
    test('should send a DELETE request and succeed on 200', () async {
      when(mockHttpClient.delete(Uri.parse('$baseUrl/products/1')))
          .thenAnswer((_) async => http.Response('', 200));

      await dataSource.deleteProduct(1);
      verify(mockHttpClient.delete(Uri.parse('$baseUrl/products/1')));
    });

    test('should throw an Exception if the response is not 200', () async {
      when(mockHttpClient.delete(Uri.parse('$baseUrl/products/1')))
          .thenAnswer((_) async => http.Response('Error', 404));

      expect(() => dataSource.deleteProduct(1), throwsException);
    });
  });
}
