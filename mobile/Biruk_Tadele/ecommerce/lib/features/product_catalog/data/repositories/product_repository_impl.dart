import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';


class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

 
  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getAllProducts();
        await localDataSource.cacheProducts(remoteProducts);
        return  Right(remoteProducts);
      } catch (e) {
        return const Left(ServerFailure());
      }
    }
    return const Left(NetworkFailure());
  }

  @override
  Future<Either<Failure, Product>> getProductById(int id) async {
    try {
      // First try to get from local cache
      final cachedProduct = await localDataSource.getCachedProduct(id);
      return Right(cachedProduct);
    } catch (_) {
      // If not in cache, check network connection
      if (await networkInfo.isConnected) {
        try {
          final remoteProduct = await remoteDataSource.getProductById(id);
         
          await localDataSource.cacheProduct(remoteProduct);
          return Right(remoteProduct);
        } catch (e) {
          return const Left(ServerFailure());
        }
      } else {
        return const Left(NetworkFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> addProduct(Product product) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.addProduct(product);
        await localDataSource.cacheProduct(product);
        return const Right(null);
      } catch (e) {
        return const Left(ServerFailure());
      }
    }
    return const Left(NetworkFailure());
}

  @override
  Future<Either<Failure, void>> updateProduct(Product product) async {
    if (await networkInfo.isConnected) {
        try {
          await remoteDataSource.updateProduct(product);
          await localDataSource.cacheProduct(product);
          return const Right(null);
        } catch (e) {
          return const Left(ServerFailure());
        }
      }
      

    return const Left(NetworkFailure());
}

  @override
  Future<Either<Failure, void>> deleteProduct(int id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteProduct(id);
        await localDataSource.removeCachedProduct(id);
        return const Right(null);
      } catch (e) {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}