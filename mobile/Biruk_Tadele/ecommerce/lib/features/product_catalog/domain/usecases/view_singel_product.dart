import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/product_repository.dart';
import '../entities/product.dart';

class ViewSingleProductUsecase {
  final ProductRepository repository;

  ViewSingleProductUsecase(this.repository);

  Future<Either<Failure, Product>> call(int id) async {
    return await repository.getProductById(id);
  }
}
