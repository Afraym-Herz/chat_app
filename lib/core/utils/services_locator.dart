import 'package:bookly_app_/core/utils/api_services.dart';
import 'package:bookly_app_/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setUpServicesLocator() {

getIt.registerSingleton<ApiService>(
     ApiService(Dio())
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
  
}
