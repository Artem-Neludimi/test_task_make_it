part of 'auth_timer_bloc.dart';

@immutable
sealed class AuthTimerEvent {
  const AuthTimerEvent();
}

class AuthTimerEventStart extends AuthTimerEvent {
  const AuthTimerEventStart();
}
