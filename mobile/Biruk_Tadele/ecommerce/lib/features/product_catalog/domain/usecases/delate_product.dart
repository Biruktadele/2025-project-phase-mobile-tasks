import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/product_repository.dart';

class DelateProductUsecase {
  final ProductRepository repository;

  DelateProductUsecase(this.repository);

  Future<Either<Failure, void>> call(int id) async {
    return await repository.deleteProduct(id);
  }
}
