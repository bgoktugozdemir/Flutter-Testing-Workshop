import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_workshop/counter/data/counter_data_source.dart';

void main() {
  group('CounterDataSource', () {
    late CounterDataSource counterDataSource;

    setUp(() {
      // TODO(1): Initialize `CounterDataSource`
      counterDataSource = const CounterDataSource();
    });

    group('increase', () {
      test('returns [1] when value is 0', () async {
        // TODO(2): Test it
        final result = await counterDataSource.increase(0);

        expect(result, 1);
      });
    });

    group('decrease', () {
      test('returns [4] when value is 5', () async {
        // TODO(3): Test it
        final result = await counterDataSource.decrease(5);

        expect(result, 4);
      });

      test('returns [0] when value is 0', () async {
        // TODO(4): Test it
        final result = await counterDataSource.decrease(0);

        expect(result, 0);
      });
    });

    group('reset', () {
      test('returns [0]', () async {
        // TODO(5): Test it
        final result = await counterDataSource.reset();

        expect(result, 0);
      });
    });
  });
}
