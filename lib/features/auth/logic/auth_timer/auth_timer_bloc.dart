import 'dart:async';

import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_make_it/core/extensions/date_time_extensions.dart';

part 'auth_timer_event.dart';

class AuthTimerBloc extends Bloc<AuthTimerEvent, String> {
  AuthTimerBloc() : super(DateTime.now().stringHhMm) {
    on<AuthTimerEvent>(
      (event, emit) => switch (event) {
        AuthTimerEventStart() => _onTimerStart(emit),
      },
    );
  }

  final Stream<DateTime> _timer = Stream.periodic(const Duration(milliseconds: 250), (_) {
    return DateTime.now();
  });

  Future<void> _onTimerStart(Emitter<String> emit) async {
    await emit.forEach(_timer, onData: (data) {
      return DateTime.now().stringHhMm;
    });
  }
}
