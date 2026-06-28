abstract class AuthState {}

class AuthInitial extends AuthState{}
class AuthLoading extends AuthState{}
class Authenticated extends AuthState{}
class UnAuthenticated extends AuthState{}
class AuthSuccuess extends AuthState{
  final String message;
  AuthSuccuess(this.message);

}


class AuthFailure extends AuthState{
  final String message;
  AuthFailure(this.message);

}