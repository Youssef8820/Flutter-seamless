import 'package:Mawthoq/core/usecases/validate_email_use_case.dart';
import 'package:get_it/get_it.dart';
import '/core/infrastructure/services/image_picker_service.dart';
import '/core/usecases/validate_password_use_case.dart';
import '/core/usecases/validate_phone_use_case.dart';
import '/core/usecases/validate_username_use_case.dart';
import '/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import '/features/auth/data/repo/auth_repo_impl.dart';
import '/features/auth/domain/repo/auth_repo.dart';
import '/features/auth/domain/usecases/register_use_case.dart';
import '/features/auth/domain/usecases/login_use_case.dart';
import '../infrastructure/services/network_service.dart';

final GetIt getIt = GetIt.instance;

abstract class AppModule {

  static void setup() {

    //services
    getIt.registerSingleton<NetworkService>(NetworkServiceImpl());
    getIt.registerSingleton<ImagePickerService>(ImagePickerServiceImpl());

    //data source
    getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());

    //repos
    getIt.registerSingleton<AuthRepo>(AuthRepoImpl());

    //use case
    getIt.registerSingleton<LoginUseCase>(LoginUseCase());
    getIt.registerSingleton<RegisterUseCase>(RegisterUseCase());

    //validate form field
    getIt.registerSingleton<ValidatePhoneUseCase>(ValidatePhoneUseCase());
    getIt.registerSingleton<ValidatePasswordUseCase>(ValidatePasswordUseCase());
    getIt.registerSingleton<ValidateUsernameUseCase>(ValidateUsernameUseCase());
    getIt.registerSingleton<ValidateEmailUseCase>(ValidateEmailUseCase());



  }


}

