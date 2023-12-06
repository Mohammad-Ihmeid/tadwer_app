import 'package:get_it/get_it.dart';
import 'package:tadwer_app/auth/data/datasource/auth_remote_data_source.dart';
import 'package:tadwer_app/auth/data/repository/login_repository.dart';
import 'package:tadwer_app/auth/domain/repository/base_login_repository.dart';
import 'package:tadwer_app/auth/domain/usecases/check_login_usecase.dart';
import 'package:tadwer_app/auth/presentation/controller/login_bloc/login_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  init() {
    //Bloc
    getIt.registerFactory(() => LoginBloc(getIt()));

    //Use Case
    getIt.registerLazySingleton(() => CheckLogInUseCase(getIt()));

    //Repository
    getIt.registerLazySingleton<BaseLogInRepository>(
        () => LogInRepository(getIt()));

    //Data Source
    getIt.registerLazySingleton<BaseAuthRemoteDataSource>(
      () => AuthRemoteDataSource(),
    );
  }
}
