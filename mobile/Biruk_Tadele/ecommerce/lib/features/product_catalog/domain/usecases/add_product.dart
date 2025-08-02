import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class AddProductUsecase {
  final ProductRepository repository;

  AddProductUsecase(this.repository);

  Future<Either<Failure, void>> call(Product product) async {
    return await repository.addProduct(product);
  }
}