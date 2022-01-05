import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on<CounterStartEvent>((event, emit) async {
      await Future.delayed(Duration(milliseconds: 5000));
      emit(const CounterLoadedState(counter: 0));
    });

    on<CounterResetEvent>((event, emit) {
      emit(const CounterLoadedState(counter: 0));
    });

    on<CounterIncrementEvent>((event, emit) {
      final counter = (state as CounterLoadedState).counter;
      emit(CounterLoadedState(counter: counter + 1));
    });

    on<CounterDecrementEvent>((event, emit) {
      final counter = (state as CounterLoadedState).counter;
      emit(CounterLoadedState(counter: counter - 1));
    });
  }
}
