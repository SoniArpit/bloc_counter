import 'dart:async';
import 'package:bloc_counter/CounterEvent.dart';

class CounterBloc {
  int counter = 0;

  final _counterStreamController = StreamController<int>();

  Stream<int> get counterStream => _counterStreamController.stream;
  StreamSink<int> get counterSink => _counterStreamController.sink;

  final _counterIncrementStreamController = StreamController<CounterEvent>();
  StreamSink<CounterEvent> get counterIncrementSink =>
      _counterIncrementStreamController.sink;

  CounterBloc() {
    _counterIncrementStreamController.stream.listen(increment);
  }

  increment(CounterEvent event) {
    if (event is CounterIncrementEvent) {
      counter++;
    } else if (event is CounterDecrementEvent) {
      counter--;
    }
    counterSink.add(counter);
  }

  void dispose() {
    _counterStreamController.close();
    _counterIncrementStreamController.close();
  }
}
