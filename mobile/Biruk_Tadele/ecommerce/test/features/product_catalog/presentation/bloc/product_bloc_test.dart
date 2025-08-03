import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/product_catalog/domain/entities/product.dart';
import 'package:ecommerce/features/product_catalog/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/product_catalog/presentation/bloc/product_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late ProductBloc productBloc;
  late MockProductRepository mockRepository;

  // Create a test product
  const tProduct = Product(
    id: 1,
    name: 'Shoes',
    price: 100.0,
    description: 'Comfortable running shoes',
    image: 'shoes.jpg',
  );

  final tProductList = [tProduct];

  // Register fallback values for any() matcher
  setUpAll(() {
    registerFallbackValue(tProduct);
  });

  setUp(() {
    mockRepository = MockProductRepository();
    productBloc = ProductBloc(mockRepository);
  });

  tearDown(() {
    productBloc.close();
  });

  // Load all products
  blocTest<ProductBloc, ProductState>(
    'emits [ProductLoading, ProductLoaded] when LoadAllProductEvent succeeds',
    build: () {
      when(
        () => mockRepository.getAllProducts(),
      ).thenAnswer((_) async => Right(tProductList));
      return productBloc;
    },
    act: (bloc) => bloc.add(const LoadAllProductsEvent()),
    expect: () => [const ProductLoading(), ProductLoaded(tProductList)],
  );

  // Get single product
  blocTest<ProductBloc, ProductState>(
    'emits [ProductLoading, ProductLoaded] when GetSingleProductEvent succeeds',
    build: () {
      when(
        () => mockRepository.getProductById(1),
      ).thenAnswer((_) async => const Right(tProduct));
      return productBloc;
    },
    act: (bloc) => bloc.add(const GetSingleProductEvent(1)),
    expect: () => [
      const ProductLoading(),
      const ProductLoaded([tProduct]),
    ],
  );

  // Create product
  blocTest<ProductBloc, ProductState>(
    'emits [ProductLoading, ProductCreated] when CreateProductEvent succeeds',
    build: () {
      when(
        () => mockRepository.addProduct(tProduct),
      ).thenAnswer((_) async => Right(tProductList));
      return productBloc;
    },
    act: (bloc) => bloc.add(const CreateProductEvent(tProduct)),
    expect: () => [const ProductLoading(), const ProductLoaded([])],
  );

  // Update product
  blocTest<ProductBloc, ProductState>(
    'emits [ProductLoading, ProductUpdated] when UpdateProductEvent succeeds',
    build: () {
      when(
        () => mockRepository.updateProduct(any()),
      ).thenAnswer((_) async => Right(tProductList));
      return productBloc;
    },
    act: (bloc) => bloc.add(
      const UpdateProductEvent(
        Product(
          id: 1,
          name: 'Shoes',
          price: 100.0,
          description: 'Comfortable running shoes',
          image: 'shoes.jpg',
        ),
      ),
    ),
    expect: () => [const ProductLoading(), const ProductLoaded([])],
  );

  // Delete product
  blocTest<ProductBloc, ProductState>(
    'emits [ProductLoading, ProductDeleted] when DeleteProductEvent succeeds',
    build: () {
      when(
        () => mockRepository.deleteProduct(1),
      ).thenAnswer((_) async => Right(tProductList));
      return productBloc;
    },
    act: (bloc) => bloc.add(const DeleteProductEvent(1)),
    expect: () => [const ProductLoading(), const ProductLoaded([])],
  );

  // Error case
  blocTest<ProductBloc, ProductState>(
    'emits [ProductLoading, ProductError] when any event throws an error',
    build: () {
      when(
        () => mockRepository.getAllProducts(),
      ).thenThrow(Exception('Failed to load'));
      return productBloc;
    },
    act: (bloc) => bloc.add(const LoadAllProductsEvent()),
    expect: () => [const ProductLoading(), isA<ProductError>()],
  );
}
