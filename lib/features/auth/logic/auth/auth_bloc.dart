import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task_make_it/core/extensions/date_time_extensions.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthNotPassed()) {
    on<AuthEvent>(
      (event, emit) => switch (event) {
        AuthEventConfirm() => _onConfirm(event, emit),
      },
    );
  }

  Future<void> _onConfirm(AuthEventConfirm event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    await Future<void>.delayed(const Duration(seconds: 1));
    if (event.time == DateTime.now().stringHhMm) {
      emit(const AuthPassed());
    } else {
      emit(const AuthNotConfirmed());
    }
  }
}
