part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

class CounterStartEvent extends CounterEvent{}

class CounterResetEvent extends CounterEvent{}

class CounterIncrementEvent extends CounterEvent{}

class CounterDecrementEvent extends CounterEvent{}

