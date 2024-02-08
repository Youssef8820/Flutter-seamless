import 'package:get_it/get_it.dart';
import 'package:smart_soft/features/auth/data/repo/auth_repo_impl.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';
import 'package:smart_soft/features/auth/domain/usecases/register_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/sign_in_use_case.dart';
import '../../features/auth/data/data_source/remote_data_source/firebase_service.dart';
import '../infrastructure/services/network_service.dart';

final GetIt getIt = GetIt.instance;

abstract class AppModule {

  static void setup() {

    //services
    getIt.registerSingleton<NetworkService>(NetworkServiceImpl());

    //data source
    getIt.registerSingleton<FirebaseService>(FirebaseService());

    //repos
    getIt.registerSingleton<AuthRepo>(AuthRepoImpl());

    //use case
    getIt.registerSingleton<SignInUseCase>(SignInUseCase());
    getIt.registerSingleton<RegisterUseCase>(RegisterUseCase());



  }


}

