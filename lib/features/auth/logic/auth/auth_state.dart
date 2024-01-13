part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthNotPassed extends AuthState {
  const AuthNotPassed();
}

final class AuthPassed extends AuthState {
  const AuthPassed();
}

final class AuthNotConfirmed extends AuthState {
  const AuthNotConfirmed();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}
