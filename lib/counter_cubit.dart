import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment() {
    emit(CounterIncrement((state).value + 1));
  }

  void decrement() {
    emit(CounterDecrement((state).value - 1));
  }
}
