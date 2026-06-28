import 'package:get_it/get_it.dart';
import 'package:zomato/core/network/dio_client.dart';
import 'package:zomato/core/services/secure_storage_service.dart';
import 'package:zomato/features/auth/bloc/auth_bloc.dart';
import 'package:zomato/features/auth/data/repositories/auth_repository.dart';

final sl=GetIt.instance;

Future<void>initDependencies()async{
  sl.registerLazySingleton<SecureStorageService>(()=>SecureStorageService());
  sl.registerLazySingleton<DioClient>(()=>DioClient());
  sl.registerLazySingleton<AuthRepository>(()=>AuthRepository(storage: sl(), dioClient: sl()));
  sl.registerLazySingleton<AuthBloc>(()=>AuthBloc(repository: sl()));
  //repo
  //bloc
}