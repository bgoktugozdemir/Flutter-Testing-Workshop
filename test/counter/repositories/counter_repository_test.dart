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
      counterDataSource = MockCounterDataSource();
    });

    test('initial counter value is 0', () {
      // TODO(8): Test it
      counterRepository = CounterRepository();

      expect(counterRepository.value, 0);
    });

    test('initialValue parameter sets value correctly', () {
      // TODO(9): Test it
      const initialValue = 5;

      counterRepository = CounterRepository(initialValue: initialValue);

      expect(counterRepository.value, initialValue);
    });

    group('increase', () {
      const initialValue = 0;
      const expected = 1;

      setUp(() {
        // TODO(10): Initialize CounterRepository with MockCounterDataSource
        counterRepository = CounterRepository(
          counterDataSource: counterDataSource,
        );
        // TODO(11): Set up when increase
        when(() => counterDataSource.increase(initialValue))
            .thenAnswer((_) async => expected);
      });

      test(
        'calls counterDataSource.increase() when increase is called',
        () async {
          // TODO(12): Test it
          await counterRepository.increase();

          verify(() => counterDataSource.increase(any())).called(1);
        },
      );

      test(
        'sets the value when increase is called',
        () async {
          // TODO(13): Test it
          expect(counterRepository.value, initialValue);

          await counterRepository.increase();

          expect(counterRepository.value, expected);
        },
      );
    });

    group('decrease', () {
      const initialValue = 3;
      const expected = 2;

      setUp(() {
        // TODO(14): Initialize CounterRepository with MockCounterDataSource and initialValue
        counterRepository = CounterRepository(
          counterDataSource: counterDataSource,
          initialValue: initialValue,
        );
        // TODO(15): Set up when decrase
        when(() => counterDataSource.decrease(initialValue))
            .thenAnswer((_) async => expected);
      });

      test(
        'calls counterSource.decrease() when decrease is called',
        () async {
          // TODO(16): Test it
          await counterRepository.decrease();

          verify(() => counterDataSource.decrease(any())).called(1);
        },
      );

      test(
        'sets the value when decrease is called',
        () async {
          // TODO(17): Test it
          expect(counterRepository.value, initialValue);

          await counterRepository.decrease();

          expect(counterRepository.value, expected);
        },
      );
    });

    group('reset', () {
      const initialValue = 5;
      const expected = 0;

      setUp(() {
        // TODO(18): Initialize CounterRepository with MockCounterDataSource and initialValue
        counterRepository = CounterRepository(
          counterDataSource: counterDataSource,
          initialValue: initialValue,
        );
        // TODO(19): Set up when reset
        when(() => counterDataSource.reset()).thenAnswer((_) async => expected);
      });
      test(
        'calls counterSource.reset() when reset is called',
        () async {
          // TODO(20): Test it
          await counterRepository.reset();

          verify(() => counterDataSource.reset()).called(1);
        },
      );

      test(
        'sets the value when reset is called',
        () async {
          // TODO(21): Test it
          expect(counterRepository.value, initialValue);

          await counterRepository.reset();

          expect(counterRepository.value, expected);
        },
      );
    });
  });
}
