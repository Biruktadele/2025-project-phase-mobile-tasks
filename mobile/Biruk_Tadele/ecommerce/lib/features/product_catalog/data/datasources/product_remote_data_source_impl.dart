import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constants/constant.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/product.dart';
import '../models/Product_model.dart';
import 'product_remote_data_source.dart';

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;
  final String _baseUrl;

  ProductRemoteDataSourceImpl({required this.client})
    : _baseUrl = '$baseUrl/products';

  Future<ProductModel> createProduct(ProductModel product) async {
    try {
      final response = await client.post(
        Uri.parse(_baseUrl),
        body: jsonEncode(product.toJson()),
        headers: defaultHeaders,
      );

      if (response.statusCode == 201) {
        return ProductModel.fromJson(jsonDecode(response.body));
      } else {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> deleteProduct(int id) async {
    try {
      final response = await client.delete(Uri.parse('$_baseUrl/$id'));

      if (response.statusCode != 200) {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  // ignore: override_on_non_overriding_member
  Future<ProductModel> getProduct(int id) async {
    try {
      final response = await client.get(Uri.parse('$_baseUrl/$id'));

      if (response.statusCode == 200) {
        return ProductModel.fromJson(jsonDecode(response.body));
      } else {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await client.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> products = jsonDecode(response.body);
        return products.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> updateProduct(Product product) async {
    try {
      final productModel = ProductModel.fromEntity(product);
      final response = await client.put(
        Uri.parse('$_baseUrl/${product.id}'),
        body: jsonEncode(productModel.toJson()),
        headers: defaultHeaders,
      );

      if (response.statusCode != 200) {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<Product>> getAllProducts() async {
    try {
      final response = await client.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> products = jsonDecode(response.body);
        return products
            .map((e) => ProductModel.fromJson(e).toEntity())
            .toList();
      } else {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Product> getProductById(int id) async {
    try {
      final response = await client.get(Uri.parse('$_baseUrl/$id'));

      if (response.statusCode == 200) {
        return ProductModel.fromJson(jsonDecode(response.body)).toEntity();
      } else {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> addProduct(Product product) async {
    try {
      final productModel = ProductModel.fromEntity(product);
      final response = await client.post(
        Uri.parse(_baseUrl),
        body: jsonEncode(productModel.toJson()),
        headers: defaultHeaders,
      );

      if (response.statusCode != 201) {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
