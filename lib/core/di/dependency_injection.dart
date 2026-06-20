import 'package:get_it/get_it.dart';
import 'package:zomato/core/network/dio_client.dart';
import 'package:zomato/core/services/secure_storage_service.dart';

final sl=GetIt.instance;

Future<void>initDependencies()async{
  sl.registerLazySingleton<SecureStorageService>(()=>SecureStorageService());
  sl.registerLazySingleton<DioClient>(()=>DioClient());

  //repo
  //bloc
}