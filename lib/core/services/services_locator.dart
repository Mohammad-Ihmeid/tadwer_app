import 'package:get_it/get_it.dart';
import 'package:tadwer_app/auth/data/datasource/auth_remote_data_source.dart';
import 'package:tadwer_app/auth/data/repository/login_repository.dart';
import 'package:tadwer_app/auth/domain/repository/base_login_repository.dart';
import 'package:tadwer_app/auth/domain/usecases/check_login_usecase.dart';
import 'package:tadwer_app/auth/domain/usecases/get_user_info_usecase.dart';
import 'package:tadwer_app/auth/presentation/controller/login_bloc.dart';
import 'package:tadwer_app/company/data/datasource/company_remote_data_source.dart';
import 'package:tadwer_app/company/data/repository/company_repository.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/add_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/add_basket_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/check_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/update_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/delete_basket_by_west_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/get_data_basket.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/update_basket_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/connect_user_with_company_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_all_category_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_all_company_type_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_company_type_by_id_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_waste_by_category_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/order_usecase/add_order_usecase.dart';
import 'package:tadwer_app/company/presentation/controller/bloc_address/address_bloc.dart';
import 'package:tadwer_app/company/presentation/controller/bloc_basket/basket_bloc.dart';
import 'package:tadwer_app/company/presentation/controller/bloc_recycling_request/recycling_request_bloc.dart';
import 'package:tadwer_app/company/presentation/controller/company_type_bloc/company_type_bloc.dart';
import 'package:tadwer_app/company/presentation/controller/waste_bloc/waste_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  init() {
    //Bloc
    getIt.registerFactory(() => LoginBloc(getIt(), getIt()));
    getIt.registerFactory(
      () => CompanyTypeBloc(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ),
    );
    getIt.registerFactory(() => WasteBloc(getIt(), getIt()));
    getIt.registerFactory(() => BasketBloc(getIt(), getIt(), getIt()));
    getIt.registerFactory(() => RecyclingRequestBloc(
          getIt(),
          getIt(),
          getIt(),
        ));
    getIt.registerFactory(() => AddressBloc(getIt(), getIt(), getIt()));

    //Use Case
    getIt.registerLazySingleton(() => CheckLogInUseCase(getIt()));
    getIt.registerLazySingleton(() => GetUserInfoUseCase(getIt()));
    ////////////////////////////////////////////////////////////////
    getIt.registerLazySingleton(() => GetAllCompanyTypeUseCase(getIt()));
    getIt.registerLazySingleton(() => GetAllCategoryUseCase(getIt()));
    getIt.registerLazySingleton(() => GetWasteByCategoryUseCase(getIt()));
    getIt.registerLazySingleton(() => AddBasketUseCase(getIt()));
    getIt.registerLazySingleton(() => ConnectUserWithCompanyUseCase(getIt()));
    getIt.registerLazySingleton(() => GetCompanyTypeByIdUseCase(getIt()));
    ////////////////////////////////////////////////////////////////
    getIt.registerLazySingleton(() => GetDataBasketUseCase(getIt()));
    getIt.registerLazySingleton(() => DeleteBasketByWestUseCase(getIt()));
    getIt.registerLazySingleton(() => UpdateBasketUseCase(getIt()));
    ////////////////////////////////////////////////////////////////
    getIt.registerLazySingleton(() => AddUserAddressUseCase(getIt()));
    getIt.registerLazySingleton(() => CheckUserAddressUseCase(getIt()));
    getIt.registerLazySingleton(() => UpdateAddressUseCase(getIt()));
    ////////////////////////////////////////////////////////////////
    getIt.registerLazySingleton(() => AddOrderUseCase(getIt()));

    //Repository
    getIt.registerLazySingleton<BaseLogInRepository>(
        () => LogInRepository(getIt()));
    getIt.registerLazySingleton<BaseCompanyRepository>(
        () => CompanyRepository(getIt()));

    //Data Source
    getIt.registerLazySingleton<BaseAuthRemoteDataSource>(
      () => AuthRemoteDataSource(),
    );
    getIt.registerLazySingleton<BaseCompanyRemoteDataSource>(
      () => CompanyRemoteDataSource(),
    );
  }
}
