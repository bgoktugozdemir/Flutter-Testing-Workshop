import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_workshop/counter/data/counter_data_source.dart';
import 'package:flutter_testing_workshop/counter/repositories/counter_repository.dart';
import 'package:mocktail/mocktail.dart';

// TODO(6): Mock CounterDataSource
class MockCounterDataSource extends Mock implements CounterDataSource {}

void main() {
  group('CounterRepository', () {
    late CounterRepository counterRepository;
    late CounterDataSource counterDataSource;

    setUp(() {
      // TODO(7): Initialize MockCounterDataSource

      // TODO(8): Initialize CounterRepository with MockCounterDataSource
    });

    test('initial counter value is 0', () {
      // TODO(9): Test it
    });

    test('initialValue parameter sets value correctly', () {
      // TODO(10): Test it
    });

    group('increase', () {
      const initialValue = 0;
      const expected = 1;

      setUp(() {
        // TODO(11): Set up when increase
      });

      test(
        'calls counterDataSource.increase() when increase is called',
        () async {
          // TODO(12): Test it
        },
      );

      test(
        'sets the value when increase is called',
        () async {
          // TODO(13): Test it
        },
      );
    });

    group('decrease', () {
      const initialValue = 3;
      const expected = 2;

      setUp(() {
        // TODO(14): Initialize CounterRepository with MockCounterDataSource and initialValue

        // TODO(15): Set up when decrase
      });

      test(
        'calls counterSource.decrease() when decrease is called',
        () async {
          // TODO(16): Test it
        },
      );

      test(
        'sets the value when decrease is called',
        () async {
          // TODO(17): Test it
        },
      );
    });

    group('reset', () {
      const initialValue = 5;
      const expected = 0;

      setUp(() {
        // TODO(18): Initialize CounterRepository with MockCounterDataSource and initialValue

        // TODO(19): Set up when reset
      });
      test(
        'calls counterSource.reset() when reset is called',
        () async {
          // TODO(20): Test it
        },
      );

      test(
        'sets the value when reset is called',
        () async {
          // TODO(21): Test it
        },
      );
    });
  });
}
