import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/product.dart';
import '../models/Product_model.dart';
import 'product_local_data_source.dart';

const CACHED_PRODUCTS_KEY = 'CACHED_PRODUCTS';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheProducts(List<Product> products) async {
    // Convert List<Product> to List<ProductModel> and then to JSON
    final productJsonList = products
        .map(
          (product) => json.encode(ProductModel.fromEntity(product).toJson()),
        )
        .toList();
    await sharedPreferences.setStringList(CACHED_PRODUCTS_KEY, productJsonList);
  }

  @override
  Future<List<Product>> getCachedProducts() async {
    final jsonStringList = sharedPreferences.getStringList(CACHED_PRODUCTS_KEY);
    if (jsonStringList != null) {
      return jsonStringList
          .map(
            (jsonStr) => ProductModel.fromJson(json.decode(jsonStr)).toEntity(),
          )
          .toList();
    } else {
      throw CacheException(message: 'No cached products found');
    }
  }

  @override
  Future<void> cacheProduct(Product product) async {
    final currentList = await getCachedProducts();
    final updatedList = [...currentList, product];
    await cacheProducts(updatedList);
  }

  @override
  Future<Product> getCachedProduct(int id) async {
    final cachedList = await getCachedProducts();
    try {
      return cachedList.firstWhere((product) => product.id == id);
    } catch (e) {
      throw CacheException(message: 'No cached product found with id: $id');
    }
  }

  @override
  Future<void> removeCachedProduct(int id) async {
    final cachedList = await getCachedProducts();
    final updatedList = cachedList
        .where((product) => product.id != id)
        .toList();
    await cacheProducts(updatedList);
  }
}
