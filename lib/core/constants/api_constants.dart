class ApiConstants {
  ApiConstants._();

  static const String baseUrl =
      'http://10.0.2.2:4000/api'; 

  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String refresh = '/auth/refresh';
  static const String logout = '/auth/logout';
}