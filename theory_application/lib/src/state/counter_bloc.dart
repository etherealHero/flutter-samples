import 'package:flutter_bloc/flutter_bloc.dart';

sealed class CounterEvent {}

final class CounterEventPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEventPressed>((event, emit) {
      emit(state + 1);
    });
  }
}
