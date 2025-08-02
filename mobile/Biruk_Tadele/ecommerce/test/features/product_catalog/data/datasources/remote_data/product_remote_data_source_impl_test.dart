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
  late MockClient mockClient;

  const tProductModel = ProductModel(
    id: 1,
    name: 'Test Product',
    price: 9.99,
    description: 'Test Description',
    image: 'test.jpg',
  );

  final tProductList = [tProductModel];

  setUp(() {
    mockClient = MockClient();
    dataSource = ProductRemoteDataSourceImpl(client: mockClient);
  });

  group('getAllProducts', () {
    test('should return list of Product when response code is 200', () async {
      // arrange
      when(mockClient.get(Uri.parse('$baseUrl/products')))
          .thenAnswer((_) async => http.Response(jsonEncode([
                tProductModel.toJson(),
              ]), 200));

      // act
      final result = await dataSource.getAllProducts();

      // assert
      expect(result, equals(tProductList));
    });

    test('should throw Exception when response code is not 200', () async {
      when(mockClient.get(Uri.parse('$baseUrl/products')))
          .thenAnswer((_) async => http.Response('Error', 404));

      expect(() => dataSource.getAllProducts(), throwsException);
    });
  });

  group('getProductById', () {
    test('should return Product when response is 200', () async {
      when(mockClient.get(Uri.parse('$baseUrl/products/1')))
          .thenAnswer((_) async => http.Response(jsonEncode(tProductModel.toJson()), 200));

      final result = await dataSource.getProductById(1);

      expect(result, equals(tProductModel));
    });

    test('should throw Exception when product not found', () async {
      when(mockClient.get(Uri.parse('$baseUrl/products/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => dataSource.getProductById(1), throwsException);
    });
  });

  group('addProduct', () {
    test('should send POST request and succeed on 201', () async {
      when(mockClient.post(
        Uri.parse('$baseUrl/products'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('', 201));

      await dataSource.addProduct(tProductModel);
      verify(mockClient.post(
        Uri.parse('$baseUrl/products'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(tProductModel.toJson()),
      ));
    });

    test('should throw Exception if response is not 201', () async {
      when(mockClient.post(any, headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('Error', 400));

      expect(() => dataSource.addProduct(tProductModel), throwsException);
    });
  });

  group('updateProduct', () {
    test('should send PUT request and succeed on 200', () async {
      when(mockClient.put(
        Uri.parse('$baseUrl/products/1'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('', 200));

      await dataSource.updateProduct(tProductModel);
      verify(mockClient.put(
        Uri.parse('$baseUrl/products/1'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(tProductModel.toJson()),
      ));
    });

    test('should throw Exception if response is not 200', () async {
      when(mockClient.put(any, headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('Error', 400));

      expect(() => dataSource.updateProduct(tProductModel), throwsException);
    });
  });

  group('deleteProduct', () {
    test('should send DELETE request and succeed on 200', () async {
      when(mockClient.delete(Uri.parse('$baseUrl/products/1')))
          .thenAnswer((_) async => http.Response('', 200));

      await dataSource.deleteProduct(1);
      verify(mockClient.delete(Uri.parse('$baseUrl/products/1')));
    });

    test('should throw Exception if response is not 200', () async {
      when(mockClient.delete(Uri.parse('$baseUrl/products/1')))
          .thenAnswer((_) async => http.Response('Error', 404));

      expect(() => dataSource.deleteProduct(1), throwsException);
    });
  });
}
