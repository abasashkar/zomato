import 'package:bloc/bloc.dart';
import 'package:zomato/features/auth/bloc/auth_event.dart';
import 'package:zomato/features/auth/bloc/auth_state.dart';
import 'package:zomato/features/auth/data/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<RegisterRequested>(_onRegisterRequested);
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequest>(_onLogoutRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await repository.register(
        name: event.name,
        email: event.email,
        password: event.password,
        role: event.role ?? 'CUSTOMER',
      );

      emit(AuthSuccuess('Registration successful'));
      emit(UnAuthenticated());
    } catch (e) {
      emit(AuthFailure(_getErrorMessage(e)));
    }
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await repository.login(
        email: event.email,
        password: event.password,
      );

      emit(AuthSuccuess('Login successful'));
      emit(Authenticated());
    } catch (e) {
      emit(AuthFailure(_getErrorMessage(e)));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequest event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await repository.logout();
      emit(UnAuthenticated());
    } catch (e) {
      emit(AuthFailure(_getErrorMessage(e)));
    }
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    final loggedIn = await repository.isLoggedin();

    if (loggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }

  String _getErrorMessage(Object e) {
    final message = e.toString();
    if (message.startsWith('Exception: ')) {
      return message.replaceFirst('Exception: ', '');
    }
    return message;
  }
}