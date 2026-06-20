import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:zomato/core/constants/api_constants.dart';
import 'package:zomato/core/network/auth_interceptor.dart';
import 'package:zomato/core/services/secure_storage_service.dart';


class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout:
            const Duration(seconds: 30),
        receiveTimeout:
            const Duration(seconds: 30),
        sendTimeout:
            const Duration(seconds: 30),
        headers: {
          'Content-Type':
              'application/json',
          'Accept':
              'application/json',
        },
      ),
    );

    dio.interceptors.add(
      AuthInterceptor(
        dio: dio,
        storage:
            GetIt.I<SecureStorageService>(),
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }
}