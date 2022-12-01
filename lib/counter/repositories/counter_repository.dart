import 'package:flutter_testing_workshop/counter/data/counter_data_source.dart';

class CounterRepository {
  CounterRepository({
    CounterDataSource? counterDataSource,
    int? initialValue,
  })  : _counterDataSource = counterDataSource ?? const CounterDataSource(),
        _value = initialValue ?? 0;

  final CounterDataSource _counterDataSource;
  int _value;

  int get value => _value;

  Future<void> increase() async {
    _value = await _counterDataSource.increase(_value);
  }

  Future<void> decrease() async {
    _value = await _counterDataSource.decrease(_value);
  }

  Future<void> reset() async {
    _value = await _counterDataSource.reset();
  }
}
