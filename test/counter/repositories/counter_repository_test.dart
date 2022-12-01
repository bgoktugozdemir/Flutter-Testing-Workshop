import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_workshop/counter/data/counter_data_source.dart';
import 'package:flutter_testing_workshop/counter/repositories/counter_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterDataSource extends Mock implements CounterDataSource {}

void main() {
  group('CounterRepository', () {
    late CounterRepository counterRepository;
    late CounterDataSource counterDataSource;

    setUp(() {
      counterDataSource = MockCounterDataSource();
    });

    test('initial counter value is 0', () {
      counterRepository = CounterRepository();

      expect(counterRepository.value, 0);
    });

    test('initialValue parameter sets value correctly', () {
      const initialValue = 5;

      counterRepository = CounterRepository(initialValue: initialValue);

      expect(counterRepository.value, initialValue);
    });

    group('increase', () {
      const initialValue = 0;
      const expected = 1;

      setUp(() {
        counterRepository = CounterRepository(
          counterDataSource: counterDataSource,
        );

        when(() => counterDataSource.increase(initialValue))
            .thenAnswer((_) async => expected);
      });

      test(
        'calls counterDataSource.increase() when increase is called',
        () async {
          await counterRepository.increase();

          verify(() => counterDataSource.increase(any())).called(1);
        },
      );

      test(
        'sets the value when increase is called',
        () async {
          expect(counterRepository.value, equals(initialValue));

          await counterRepository.increase();

          expect(counterRepository.value, equals(expected));
        },
      );
    });

    group('decrease', () {
      const initialValue = 3;
      const expected = 2;

      setUp(() {
        counterRepository = CounterRepository(
          counterDataSource: counterDataSource,
          initialValue: initialValue,
        );

        when(() => counterDataSource.decrease(initialValue))
            .thenAnswer((_) async => expected);
      });

      test(
        'calls counterSource.decrease() when decrease is called',
        () async {
          await counterRepository.decrease();

          verify(() => counterDataSource.decrease(any())).called(1);
        },
      );

      test(
        'sets the value when decrease is called',
        () async {
          expect(counterRepository.value, equals(initialValue));

          await counterRepository.decrease();

          expect(counterRepository.value, equals(expected));
        },
      );
    });

    group('reset', () {
      const initialValue = 5;
      const expected = 0;

      setUp(() {
        counterRepository = CounterRepository(
          counterDataSource: counterDataSource,
          initialValue: initialValue,
        );

        when(() => counterDataSource.reset()).thenAnswer((_) async => expected);
      });
      test(
        'calls counterSource.reset() when reset is called',
        () async {
          await counterRepository.reset();

          verify(() => counterDataSource.reset()).called(1);
        },
      );

      test(
        'sets the value when reset is called',
        () async {
          expect(counterRepository.value, equals(initialValue));

          await counterRepository.reset();

          expect(counterRepository.value, equals(expected));
        },
      );
    });
  });
}
