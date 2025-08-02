import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/entities/product.dart';
import '../../models/product_model.dart';
import 'product_local_data_source.dart';

const cachedProductsKey = 'CACHED_PRODUCTS';
const cachedProductKeyPrefix = 'CACHED_PRODUCT_';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheProducts(List<Product> products) async {
    final productModels = products.map((p) => ProductModel.fromEntity(p).toJson()).toList();
    final jsonString = jsonEncode(productModels);
    await sharedPreferences.setString(cachedProductsKey, jsonString);
  }

  @override
  Future<List<Product>> getCachedProducts() async {
    final jsonString = sharedPreferences.getString(cachedProductsKey);
    if (jsonString != null) {
      final List<dynamic> decoded = jsonDecode(jsonString);
      return decoded.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('No cached products found');
    }
  }

  @override
  Future<void> cacheProduct(Product product) async {
    final jsonString = jsonEncode(ProductModel.fromEntity(product).toJson());
    await sharedPreferences.setString('$cachedProductKeyPrefix${product.id}', jsonString);
  }

  @override
  Future<Product> getCachedProduct(int id) async {
    final jsonString = sharedPreferences.getString('$cachedProductKeyPrefix$id');
    if (jsonString != null) {
      final decoded = jsonDecode(jsonString);
      return ProductModel.fromJson(decoded);
    } else {
      throw Exception('Cached product with id $id not found');
    }
  }

  @override
  Future<void> removeCachedProduct(int id) async {
    await sharedPreferences.remove('$cachedProductKeyPrefix$id');
  }
}
