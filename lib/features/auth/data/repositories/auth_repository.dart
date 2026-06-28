import 'package:dio/dio.dart';
import 'package:zomato/core/constants/api_constants.dart';
import 'package:zomato/core/network/dio_client.dart';
import 'package:zomato/core/services/secure_storage_service.dart';
import 'package:zomato/features/auth/data/models/login_response.dart';
import 'package:zomato/features/auth/data/models/user_model.dart';

class AuthRepository {
  final SecureStorageService storage;
  final DioClient dioClient;

  AuthRepository({
    required this.storage,
    required this.dioClient,
  });

  Dio get _dio => dioClient.dio;

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.register,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'role': role,
        },
      );

      final data = response.data;

      return UserModel.fromJson(data['user']);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Registration Failed',
      );
    }
  }

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      final loginResponse = LoginResponse.fromJson(response.data);

      await storage.saveAccessToken(loginResponse.accessToken);
      await storage.saveRefreshToken(loginResponse.refreshToken);

      return loginResponse;
    } on DioException catch (e) {
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');

      throw Exception(
        e.response?.data['message'] ?? 'Login Failed',
      );
    }
  }

  Future<void> logout() async {
    try {
      final refreshToken = await storage.getRefreshToken();

      if (refreshToken != null && refreshToken.isNotEmpty) {
        await _dio.post(
          ApiConstants.logout,
          data: {
            'refreshToken': refreshToken,
          },
        );
      }
    } catch (_) {}

    await storage.clearAll();
  }

  Future<bool> isLoggedin() async {
    return storage.isLoggedin();
  }
}