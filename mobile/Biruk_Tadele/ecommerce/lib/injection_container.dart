import 'package:get_it/get_it.dart';  
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network.dart';
import 'features/product_catalog/data/datasources/local_data/product_local_data_source.dart';
import 'features/product_catalog/data/datasources/local_data/product_local_data_source_impl.dart';
import 'features/product_catalog/data/datasources/remote_data/product_remote_data_source.dart';
import 'features/product_catalog/data/datasources/remote_data/product_remote_data_source_impl.dart';
import 'features/product_catalog/data/repositories/product_repository_impl.dart';
import 'features/product_catalog/domain/repositories/product_repository.dart';
import 'features/product_catalog/domain/usecases/add_product.dart';
import 'features/product_catalog/domain/usecases/delate_product.dart';
import 'features/product_catalog/domain/usecases/update_product.dart';
import 'features/product_catalog/domain/usecases/view_all_products.dart';
import 'features/product_catalog/domain/usecases/view_singel_product.dart';
import 'features/product_catalog/presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Product Catalog
  sl.registerFactory(() => ProductBloc(sl()));
  // usecase
  sl.registerLazySingleton(() => ViewAllProductsUsecase(sl()));
  sl.registerLazySingleton(() => ViewSingleProductUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProductUsecase(sl()));
  sl.registerLazySingleton(() => DelateProductUsecase(sl()));
  sl.registerLazySingleton(() => AddProductUsecase(sl()));
  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data Source
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(sharedPreferences: sl()),
  );
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker());
}
