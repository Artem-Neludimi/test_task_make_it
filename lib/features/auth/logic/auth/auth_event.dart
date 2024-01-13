part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

final class AuthEventConfirm extends AuthEvent {
  const AuthEventConfirm(this.time);

  final String time;
}
