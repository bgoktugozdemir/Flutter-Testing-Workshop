import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_workshop/counter/data/counter_data_source.dart';

void main() {
  group('CounterDataSource', () {
    late CounterDataSource counterDataSource;

    setUp(() {
      // TODO(1): Initialize `CounterDataSource`
    });

    group('increase', () {
      test('returns [1] when value is 0', () async {
        // TODO(2): Test it
      });
    });

    group('decrease', () {
      test('returns [4] when value is 5', () async {
        // TODO(3): Test it
      });

      test('returns [0] when value is 0', () async {
        // TODO(4): Test it
      });
    });

    group('reset', () {
      test('returns [0]', () async {
        // TODO(5): Test it
      });
    });
  });
}
