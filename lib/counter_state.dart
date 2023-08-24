part of 'counter_cubit.dart';

sealed class CounterState {
  int get value => 0;
}

class CounterInitial extends CounterState {
  @override
  final int value;

  CounterInitial({this.value = 0});
}

class CounterIncrement extends CounterState {
  @override
  final int value;

  CounterIncrement(this.value);
}

class CounterDecrement extends CounterState {
  @override
  final int value;

  CounterDecrement(this.value);
}
