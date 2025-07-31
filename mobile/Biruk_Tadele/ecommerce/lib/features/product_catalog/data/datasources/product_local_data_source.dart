import '../../domain/entities/product.dart';

abstract class ProductLocalDataSource {
  Future<List<Product>> getCachedProducts();
  Future<void> cacheProducts(List<Product> products);
  Future<Product> getCachedProduct(int id);
  Future<void> cacheProduct(Product product);
  Future<void> removeCachedProduct(int id);
}
