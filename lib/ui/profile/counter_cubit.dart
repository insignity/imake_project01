import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}

Future<void> main(List<String> args) async {
  final bloc = CounterBloc();

  final streamSubscription = bloc.listen(print);
  bloc.add(CounterEvent.increment);
  await Future.delayed(Duration(seconds: 1));
  bloc.add(CounterEvent.increment);
  await Future.delayed(Duration(seconds: 1));
  bloc.add(CounterEvent.increment);
  await Future.delayed(Duration(seconds: 1));
  bloc.add(CounterEvent.increment);

  await streamSubscription.cancel();
  await bloc.close();
}
