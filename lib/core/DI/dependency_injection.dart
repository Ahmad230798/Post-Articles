import 'package:dio/dio.dart';
import 'package:flutter_project/core/networking/api_services.dart';
import 'package:flutter_project/core/networking/dio_factory.dart';
import 'package:flutter_project/features/auth/data/repos/login_repo.dart';
import 'package:flutter_project/features/auth/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
Future<void> setupGitIt() async {
  //Dio and ApiServices
  Dio dio = DioFactory.getDio();
  getit.registerLazySingleton<ApiServices>(() => ApiServices(dio));
  //login
  getit.registerLazySingleton<LoginRepo>(() => LoginRepo(getit()));
  getit.registerLazySingleton<LoginCubit>(() => LoginCubit(getit()));
}
