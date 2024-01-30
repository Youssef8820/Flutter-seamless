import 'package:get_it/get_it.dart';
import 'package:smart_soft/features/auth/data/repo/auth_repo_impl.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';
import 'package:smart_soft/features/auth/domain/usecases/register_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:smart_soft/features/products/data/data_source/local_data_source/product_local_data_source.dart';
import 'package:smart_soft/features/products/data/repo/product_repo.dart';
import 'package:smart_soft/features/products/domain/repo/product_repo_impl.dart';
import 'package:smart_soft/features/products/domain/usecase/delete_product_use_case.dart';
import 'package:smart_soft/features/products/domain/usecase/get_all_products_use_case.dart';
import 'package:smart_soft/features/products/domain/usecase/insert_product_use_case.dart';
import '../../features/auth/data/data_source/remote_data_source/firebase_service.dart';
import '../infrastructure/services/network_service.dart';

final GetIt getIt = GetIt.instance;

abstract class AppModule {

  static void setup() {

    //services
    getIt.registerSingleton<NetworkService>(NetworkServiceImpl());

    //data source
    getIt.registerSingleton<FirebaseService>(FirebaseService());
    getIt.registerSingleton<ProductLocalDataSource>(ProductLocalDataSourceImpl());

    //repos
    getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
    getIt.registerSingleton<ProductRepo>(ProductRepoImpl());

    //use case
    getIt.registerSingleton<SignInUseCase>(SignInUseCase());
    getIt.registerSingleton<RegisterUseCase>(RegisterUseCase());

    getIt.registerSingleton<GetAllProductsUseCase>(GetAllProductsUseCase());
    getIt.registerSingleton<DeleteProductUseCase>(DeleteProductUseCase());
    getIt.registerSingleton<InsertProductUseCase>(InsertProductUseCase());


  }


}

