import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../core/constants/api_constant.dart';
import '../../../domain/entities/product.dart';
import '../../models/product_model.dart';
import 'product_remote_data_source.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Product>> getAllProducts() async {
    final response = await client.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Future<Product> getProductById(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/products/$id'));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Product not found');
    }
  }

  @override
  Future<void> addProduct(Product product) async {
    final response = await client.post(
      Uri.parse('$baseUrl/products'),
      headers: defaultHeaders,
      body: jsonEncode(ProductModel.fromEntity(product).toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add product');
    }
  }

  @override
  Future<void> updateProduct(Product product) async {
    final response = await client.put(
      Uri.parse('$baseUrl/products/${product.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(ProductModel.fromEntity(product).toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update product');
    }
  }

  @override
  Future<void> deleteProduct(int id) async {
    final response = await client.delete(Uri.parse('$baseUrl/products/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete product');
    }
  }
}
