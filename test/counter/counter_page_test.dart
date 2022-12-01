import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_workshop/counter/counter_page.dart';
import 'package:flutter_testing_workshop/counter/repositories/counter_repository.dart';
import 'package:flutter_testing_workshop/counter/widgets/counter_button.dart';
import 'package:mocktail/mocktail.dart';

import '../pump.dart';

// TODO(34): Mock CounterRepository
class MockCounterRepository extends Mock implements CounterRepository {}

void main() {
  group('CounterPage', () {
    late CounterRepository counterRepository;
    late CounterPage widget;

    setUp(() {
      // TODO(35): Initialize MockCounterRepository
      counterRepository = MockCounterRepository();
      // TODO(36): Initialize CounterPage with MockCounterRepository
      widget = CounterPage(counterRepository: counterRepository);
      // TODO(37): return 0 when counterRepository.value is called
      when(() => counterRepository.value).thenReturn(0);
    });

    group('appBar', () {
      testWidgets('renders title of AppBar', (tester) async {
        // TODO(38): pumpMaterialApp
        await tester.pumpMaterialApp(widget);
        // TODO(39): find 'Counter' in AppBar
        final title = find.widgetWithText(AppBar, 'Counter');
        // TODO(40): Test it
        expect(title, findsOneWidget);
      });

      testWidgets('renders title on center', (tester) async {
        // TODO(41): pumpMaterialApp
        await tester.pumpMaterialApp(widget);
        // TODO(42): find AppBar widget
        final appBar = tester.widget<AppBar>(find.byType(AppBar));
        // TODO(43): Test it
        expect(appBar.centerTitle, true);
      });
    });

    group('body', () {
      testWidgets('renders value Text in Center', (tester) async {
        // TODO(44): pumpMaterialApp
        await tester.pumpMaterialApp(widget);
        // TODO(45): find value in Center
        final text = find.widgetWithText(Center, '0');
        // TODO(46): Test it
        expect(text, findsOneWidget);
      });

      testWidgets('renders value Text with TextStyle', (tester) async {
        const key = Key('counter_value_key');
        const expected = TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 120,
          color: Colors.blue,
        );

        // TODO(47): pumpMaterialApp
        await tester.pumpMaterialApp(widget);
        // TODO(48): find Text widget by Key
        final text = tester.widget<Text>(find.byKey(key));
        // TODO(49): Test it
        expect(text.style, expected);
      });
    });

    group('floatingActionButton', () {
      testWidgets('renders 3 CounterButtons ', (tester) async {
        // TODO(50): pumpMaterialApp
        await tester.pumpMaterialApp(widget);
        // TODO(51): find CounterButton
        final buttons = find.byType(CounterButton);
        // TODO(52): Test it
        expect(buttons, findsNWidgets(3));
      });

      group('decrease', () {
        const icon = Icons.remove;
        const tooltip = 'Decrease';
        const backgroundColor = Colors.red;

        // TODO(53): find decreaseButton with icon in CounterButton
        final decreaseButton = find.widgetWithIcon(CounterButton, icon);

        setUp(() {
          // TODO(54): Set up when counterRepository.decrease() answer 0
          when(() => counterRepository.decrease()).thenAnswer((_) async => 0);
        });

        testWidgets(
            'calls counterRepository.decrease when tap on decrease button',
            (tester) async {
          // TODO(55): pumpMaterialApp
          await tester.pumpMaterialApp(widget);
          // TODO(56): tap on decreaseButton
          await tester.tap(decreaseButton);
          // TODO(57): Test it
          verify(() => counterRepository.decrease()).called(1);
          verifyNever(() => counterRepository.reset());
          verifyNever(() => counterRepository.increase());
        });

        testWidgets('renders decrease button with correct parameters',
            (tester) async {
          // TODO(58): pumpMaterialApp
          await tester.pumpMaterialApp(widget);
          // TODO(59): find CounterButton widget with decreaseButton
          final button = tester.widget<CounterButton>(decreaseButton);
          // TODO(60): Test it
          expect(button.icon, icon);
          expect(button.tooltip, tooltip);
          expect(button.backgroundColor, backgroundColor);
        });

        testWidgets('renders new value when tap on decrease button',
            (tester) async {
          // TODO(61): when counterRepository.value return 1
          when(() => counterRepository.value).thenReturn(1);
          // TODO(62): pumpMaterialApp
          await tester.pumpMaterialApp(widget);
          // TODO(63): Test it finds 1
          expect(find.text('1'), findsOneWidget);
          expect(find.text('0'), findsNothing);
          // TODO(64): tap on decreaseButton
          await tester.tap(decreaseButton);
          // TODO(65): when counterRepository.value return 0
          when(() => counterRepository.value).thenReturn(0);
          // TODO(66): pump
          await tester.pump();
          // TODO(67): Test it finds 0
          expect(find.text('1'), findsNothing);
          expect(find.text('0'), findsOneWidget);
        });

        testWidgets(
            'renders CircularProgressIndicator when tap on decrease button',
            (tester) async {
          final circularProgressIndicator =
              find.byType(CircularProgressIndicator);
          // TODO(68): when counterRepository.decrease() answer 0 with 10ms delay
          when(() => counterRepository.decrease()).thenAnswer(
            (_) async => Future.delayed(
              const Duration(milliseconds: 10),
              () => 0,
            ),
          );
          // TODO(69): pumpMaterialApp
          await tester.pumpMaterialApp(widget);
          // TODO(70): Test it nothing
          expect(circularProgressIndicator, findsNothing);
          // TODO(71): tap on decreaseButton
          await tester.tap(decreaseButton);
          // TODO(72): pump with 1ms duration
          await tester.pump(const Duration(milliseconds: 1));
          // TODO(73): Test it finds
          expect(circularProgressIndicator, findsOneWidget);
          // TODO(74): pumpAndSettle
          await tester.pumpAndSettle();
          // TODO(75): Test it nothing
          expect(circularProgressIndicator, findsNothing);
        });
      });

      group('reset', () {
        const icon = Icons.restore;
        const tooltip = 'Reset';
        final resetButton = find.widgetWithIcon(CounterButton, icon);

        setUp(() {
          // TODO(76): Set up when counterRepository.reset() answer 0
          when(() => counterRepository.reset()).thenAnswer((_) async => 0);
        });

        testWidgets('calls counterRepository.reset when tap on reset button',
            (tester) async {
          // TODO(77): pumpMaterialApp
          await tester.pumpMaterialApp(widget);
          // TODO(78): tap on resetButton
          await tester.tap(resetButton);
          // TODO(79): Test it
          verify(() => counterRepository.reset()).called(1);
        });

        testWidgets('renders reset button with correct parameters',
            (tester) async {
          // TODO(80): pumpMaterialApp
          await tester.pumpMaterialApp(widget);
          // TODO(81): find CounterButton widget with resetButton
          final button = tester.widget<CounterButton>(resetButton);
          // TODO(82): Test it
          expect(button.icon, icon);
          expect(button.tooltip, tooltip);
        });

        testWidgets('renders new value when tap on reset button',
            (tester) async {
          // TODO(83): when counterRepository.value return 10
          when(() => counterRepository.value).thenReturn(10);
          // TODO(84): pumpMaterialApp
          await tester.pumpMaterialApp(widget);
          // TODO(85): Test it finds 10
          expect(find.text('10'), findsOneWidget);
          expect(find.text('0'), findsNothing);
          // TODO(86): tap on decreaseButton
          await tester.tap(resetButton);
          // TODO(87): when counterRepository.value return 0
          when(() => counterRepository.value).thenReturn(0);
          // TODO(88): pump
          await tester.pump();
          // TODO(89): Test it finds 0
          expect(find.text('10'), findsNothing);
          expect(find.text('0'), findsOneWidget);
        });

        testWidgets(
            'renders CircularProgressIndicator when tap on reset button',
            (tester) async {
          final circularProgressIndicator =
              find.byType(CircularProgressIndicator);
          // TODO(90): when counterRepository.reset() answer 0 after 10ms duration
          when(() => counterRepository.reset()).thenAnswer(
            (_) async => Future.delayed(
              const Duration(milliseconds: 10),
              () => 0,
            ),
          );
          // TODO(91): pumpMaterialApp
          await tester.pumpMaterialApp(widget);
          // TODO(92): Test it finds nothing
          expect(circularProgressIndicator, findsNothing);
          // TODO(93): Tap on resetButton
          await tester.tap(resetButton);
          // TODO(94): pump after 1 ms
          await tester.pump(const Duration(milliseconds: 1));
          // TODO(95): Test it finds one
          expect(circularProgressIndicator, findsOneWidget);
          // TODO(96): pumpAndSettle
          await tester.pumpAndSettle();
          // TODO(97): Test it finds nothing
          expect(circularProgressIndicator, findsNothing);
        });
      });

      group('increase', () {
        const icon = Icons.add;
        const tooltip = 'Increase';
        const backgroundColor = Colors.green;

        final increaseButton = find.widgetWithIcon(CounterButton, icon);

        setUp(() {
          // TODO(99): Set up when counterRepository.value return 0
          when(() => counterRepository.value).thenReturn(0);
          // TODO(100): Set up when counterRepository.increase() answer 1
          when(() => counterRepository.increase()).thenAnswer((_) async => 1);
        });

        testWidgets(
            'calls counterRepository.increase when tap on increase button',
            (tester) async {
          // TODO(101): pumpMaterialApp
          await tester.pumpMaterialApp(widget);
          // TODO(102): Tap on increaseButton
          await tester.tap(increaseButton);
          // TODO(103): Test it
          verify(() => counterRepository.increase()).called(1);
        });

        testWidgets('renders increase button with correct parameters',
            (tester) async {
          // TODO(104): pumpMaterialApp
          await tester.pumpMaterialApp(widget);
          // TODO(105): find CounterButton widget with increaseButton
          final button = tester.widget<CounterButton>(increaseButton);
          // TODO(106): Test it
          expect(button.icon, icon);
          expect(button.tooltip, tooltip);
          expect(button.backgroundColor, backgroundColor);
        });

        testWidgets('renders new value when tap on increase button',
            (tester) async {
          // TODO(107): pumpMaterialApp
          await tester.pumpMaterialApp(widget);
          // TODO(108): Test it
          expect(find.text('0'), findsOneWidget);
          expect(find.text('1'), findsNothing);
          // TODO(109): Tap on increaseButton
          await tester.tap(increaseButton);
          // TODO(110): when counterRepository.value return 1
          when(() => counterRepository.value).thenReturn(1);
          // TODO(111): pump
          await tester.pump();
          // TODO(112): Test it
          expect(find.text('0'), findsNothing);
          expect(find.text('1'), findsOneWidget);
        });

        testWidgets(
            'renders CircularProgressIndicator when tap on increase button',
            (tester) async {
          final circularProgressIndicator =
              find.byType(CircularProgressIndicator);
          // TODO(113): when counterRepository.increase() answer 1 after 10ms duration
          when(() => counterRepository.increase()).thenAnswer(
            (_) async => Future.delayed(
              const Duration(milliseconds: 10),
              () => 1,
            ),
          );
          // TODO(114): pumpMaterialApp
          await tester.pumpMaterialApp(widget);
          // TODO(115): Test it nothing
          expect(circularProgressIndicator, findsNothing);
          // TODO(116): tap on decreaseButton
          await tester.tap(increaseButton);
          // TODO(117): pump with 1ms duration
          await tester.pump(const Duration(milliseconds: 1));
          // TODO(118): Test it finds
          expect(circularProgressIndicator, findsOneWidget);
          // TODO(119): pumpAndSettle
          await tester.pumpAndSettle();
          // TODO(120): Test it nothing
          expect(circularProgressIndicator, findsNothing);
        });
      });
    });
  });
}
