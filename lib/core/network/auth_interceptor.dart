import 'package:dio/dio.dart';
import 'package:zomato/core/constants/api_constants.dart';
import 'package:zomato/core/services/secure_storage_service.dart';

class AuthInterceptor extends Interceptor{
  final Dio dio;
  final SecureStorageService storage;

  AuthInterceptor({required this.dio, required this.storage});

@override
 Future<void>onRequest(
  RequestOptions options,
  RequestInterceptorHandler handler
 )async{
  final token = await storage.getAccessToken();
  if(token !=null && token.isNotEmpty){
    options.headers['Authorization']='Bearer $token';
  }
  return handler.next(options);
 } 

 @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      try {
        final refreshToken =
            await storage.getRefreshToken();

        if (refreshToken == null) {
          return handler.next(err);
        }

   final response = await Dio().post(
  '${ApiConstants.baseUrl}${ApiConstants.refresh}',  
  data: {'refreshToken': refreshToken},
  options: Options(headers: {'Content-Type': 'application/json'}),
);

        final newAccessToken =
            response.data['accessToken'];

        await storage.saveAccessToken(
          newAccessToken,
        );

        final requestOptions =
            err.requestOptions;

        requestOptions.headers[
            'Authorization'] =
            'Bearer $newAccessToken';

        final clonedResponse =
            await dio.fetch(
          requestOptions,
        );

        return handler.resolve(
          clonedResponse,
        );
      } catch (_) {
        await storage.clearAll();
      }
    }

    return handler.next(err);
  }
}
 


