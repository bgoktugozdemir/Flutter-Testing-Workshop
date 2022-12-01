import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_workshop/counter/counter_page.dart';
import 'package:flutter_testing_workshop/counter/repositories/counter_repository.dart';
import 'package:flutter_testing_workshop/counter/widgets/counter_button.dart';

// TODO(34): Mock CounterRepository

void main() {
  group('CounterPage', () {
    late CounterRepository counterRepository;
    late CounterPage widget;

    setUp(() {
      // TODO(35): Initialize MockCounterRepository

      // TODO(36): Initialize CounterPage with MockCounterRepository

      // TODO(37): return 0 when counterRepository.value is called
    });

    group('appBar', () {
      testWidgets('renders title of AppBar', (tester) async {
        // TODO(38): pumpMaterialApp

        // TODO(39): find 'Counter' in AppBar

        // TODO(40): Test it
      });

      testWidgets('renders title on center', (tester) async {
        // TODO(41): pumpMaterialApp

        // TODO(42): find AppBar widget

        // TODO(43): Test it
      });
    });

    group('body', () {
      testWidgets('renders value Text in Center', (tester) async {
        // TODO(44): pumpMaterialApp

        // TODO(45): find value in Center

        // TODO(46): Test it
      });

      testWidgets('renders value Text with TextStyle', (tester) async {
        const key = Key('counter_value_key');
        const expected = TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 120,
          color: Colors.blue,
        );

        // TODO(47): pumpMaterialApp

        // TODO(48): find Text widget by Key

        // TODO(49): Test it
      });
    });

    group('floatingActionButton', () {
      testWidgets('renders 3 CounterButtons ', (tester) async {
        // TODO(50): pumpMaterialApp

        // TODO(51): find CounterButton

        // TODO(52): Test it
      });

      group('decrease', () {
        const icon = Icons.remove;
        const tooltip = 'Decrease';
        const backgroundColor = Colors.red;

        // TODO(53): find decreaseButton with icon in CounterButton

        setUp(() {
          // TODO(54): Set up when counterRepository.decrease() answer 0
        });

        testWidgets(
            'calls counterRepository.decrease when tap on decrease button',
            (tester) async {
          // TODO(55): pumpMaterialApp

          // TODO(56): tap on decreaseButton

          // TODO(57): Test it
        });

        testWidgets('renders decrease button with correct parameters',
            (tester) async {
          const expectedIcon = Icons.remove;
          const expectedTooltip = 'Decrease';
          const expectedColor = Colors.red;

          // TODO(58): pumpMaterialApp

          // TODO(59): find CounterButton widget with decreaseButton

          // TODO(60): Test it
        });

        testWidgets('renders new value when tap on decrease button',
            (tester) async {
          // TODO(61): when counterRepository.value return 1

          // TODO(62): pumpMaterialApp

          // TODO(63): Test it finds 1

          // TODO(64): tap on decreaseButton

          // TODO(65): when counterRepository.value return 0

          // TODO(66): pump

          // TODO(67): Test it finds 0
        });

        testWidgets(
            'renders CircularProgressIndicator when tap on decrease button',
            (tester) async {
          // TODO(68): when counterRepository.decrease() answer 0 with 10ms delay

          final circularProgressIndicator =
              find.byType(CircularProgressIndicator);

          // TODO(69): pumpMaterialApp

          // TODO(70): Test it nothing

          // TODO(71): tap on decreaseButton

          // TODO(72): pump with 1ms duration

          // TODO(73): Test it finds

          // TODO(74): pumpAndSettle

          // TODO(75): Test it nothing
        });
      });

      group('reset', () {
        const icon = Icons.restore;
        const tooltip = 'Reset';
        final resetButton = find.widgetWithIcon(CounterButton, icon);

        setUp(() {
          // TODO(76): Set up when counterRepository.reset() answer 0
        });

        testWidgets('calls counterRepository.reset when tap on reset button',
            (tester) async {
          // TODO(77): pumpMaterialApp

          // TODO(78): tap on resetButton

          // TODO(79): Test it
        });

        testWidgets('renders reset button with correct parameters',
            (tester) async {
          const expectedIcon = Icons.restore;
          const expectedTooltip = 'Reset';

          // TODO(80): pumpMaterialApp

          // TODO(81): find CounterButton widget with resetButton

          // TODO(82): Test it
        });

        testWidgets('renders new value when tap on reset button',
            (tester) async {
          // TODO(83): when counterRepository.value return 10

          // TODO(84): pumpMaterialApp

          // TODO(85): Test it finds 10

          // TODO(86): tap on decreaseButton

          // TODO(87): when counterRepository.value return 0

          // TODO(88): pump

          // TODO(89): Test it finds 0
        });

        testWidgets(
            'renders CircularProgressIndicator when tap on reset button',
            (tester) async {
          // TODO(90): when counterRepository.reset() answer 0 after 10ms duration

          // TODO(91): find CircularProgressIndicator

          // TODO(92): pumpMaterialApp

          // TODO(93): Test it finds nothing

          // TODO(94): Tap on resetButton

          // TODO(95): pump after 1 ms

          // TODO(96): Test it finds one

          // TODO(97): pumpAndSettle

          // TODO(98): Test it finds nothing
        });
      });

      group('increase', () {
        final increaseButton = find.widgetWithIcon(CounterButton, Icons.add);

        setUp(() {
          // TODO(99): Set up when counterRepository.value return 0

          // TODO(100): Set up when counterRepository.increase() answer 1
        });

        testWidgets(
            'calls counterRepository.increase when tap on increase button',
            (tester) async {
          // TODO(101): pumpMaterialApp

          // TODO(102): Tap on increaseButton

          // TODO(103): Test it
        });

        testWidgets('renders increase button with correct parameters',
            (tester) async {
          const expectedIcon = Icons.add;
          const expectedTooltip = 'Increase';
          const expectedColor = Colors.green;

          // TODO(104): pumpMaterialApp

          // TODO(105): find CounterButton widget with increaseButton

          // TODO(106): Test it
        });

        testWidgets('renders new value when tap on increase button',
            (tester) async {
          // TODO(107): pumpMaterialApp

          // TODO(108): Test it

          // TODO(109): Tap on increaseButton

          // TODO(110): when counterRepository.value return 1

          // TODO(111): pump

          // TODO(112): Test it
        });

        testWidgets(
            'renders CircularProgressIndicator when tap on increase button',
            (tester) async {
          // TODO(113): when counterRepository.increase() answer 1 after 10ms duration

          // TODO(114): find CircularProgressIndicator

          // TODO(115): pumpMaterialApp

          // TODO(116): Test it nothing

          // TODO(117): tap on decreaseButton

          // TODO(118): pump with 1ms duration

          // TODO(119): Test it finds

          // TODO(120): pumpAndSettle

          // TODO(121): Test it nothing
        });
      });
    });
  });
}
