abstract class AuthEvent {}

class RegisterRequested extends AuthEvent{
  final String name;
  final String email;
  final String password;
  final String role;

  RegisterRequested({required this.name, required this.email, required this.password,required this.role});
}

class LoginRequested extends AuthEvent{
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

class LogoutRequest extends AuthEvent{}
class CheckAuthStatus extends AuthEvent{}