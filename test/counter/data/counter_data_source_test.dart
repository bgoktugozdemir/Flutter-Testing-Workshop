import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_workshop/counter/data/counter_data_source.dart';

void main() {
  group('CounterDataSource', () {
    late CounterDataSource counterDataSource;

    setUp(() {
      counterDataSource = const CounterDataSource();
    });

    group('increase', () {
      test('returns [1] when value is 0', () async {
        const value = 0;
        const expected = 1;

        final result = await counterDataSource.increase(value);

        expect(result, equals(expected));
      });
    });

    group('decrease', () {
      test('returns [4] when value is 5', () async {
        const value = 5;
        const expected = 4;

        final result = await counterDataSource.decrease(value);

        expect(result, equals(expected));
      });

      test('returns [0] when value is 0', () async {
        const value = 0;
        const expected = 0;

        final result = await counterDataSource.decrease(value);

        expect(result, equals(expected));
      });
    });

    group('reset', () {
      test('returns [0]', () async {
        const expected = 0;

        final result = await counterDataSource.reset();

        expect(result, equals(expected));
      });
    });
  });
}
