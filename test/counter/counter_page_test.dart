import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_workshop/counter/counter_page.dart';
import 'package:flutter_testing_workshop/counter/repositories/counter_repository.dart';
import 'package:flutter_testing_workshop/counter/widgets/counter_button.dart';
import 'package:mocktail/mocktail.dart';

import '../pump.dart';

class MockCounterRepository extends Mock implements CounterRepository {}

void main() {
  group('CounterPage', () {
    late CounterRepository counterRepository;
    late CounterPage widget;

    setUp(() {
      counterRepository = MockCounterRepository();
      widget = CounterPage(counterRepository: counterRepository);
      when(() => counterRepository.value).thenReturn(0);
    });

    group('appBar', () {
      testWidgets('renders title of AppBar', (tester) async {
        await tester.pumpMaterialApp(widget);

        final title = find.widgetWithText(AppBar, 'Counter');

        expect(title, findsOneWidget);
      });

      testWidgets('renders title on center', (tester) async {
        await tester.pumpMaterialApp(widget);

        final appBar = tester.widget<AppBar>(find.byType(AppBar));

        expect(appBar.centerTitle, isTrue);
      });
    });

    group('body', () {
      testWidgets('renders value Text in Center', (tester) async {
        final value = counterRepository.value;

        await tester.pumpMaterialApp(widget);

        final text = find.widgetWithText(Center, value.toString());

        expect(text, findsOneWidget);
      });

      testWidgets('renders value Text with TextStyle', (tester) async {
        const key = Key('counter_value_key');
        const expected = TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 120,
          color: Colors.blue,
        );

        await tester.pumpMaterialApp(widget);

        final text = tester.widget<Text>(find.byKey(key));

        expect(text.style, equals(expected));
      });
    });

    group('floatingActionButton', () {
      testWidgets('renders 3 CounterButtons ', (tester) async {
        await tester.pumpMaterialApp(widget);

        final finder = find.byType(CounterButton);

        expect(finder, findsNWidgets(3));
      });

      group('decrease', () {
        final decreaseButton = find.widgetWithIcon(CounterButton, Icons.remove);

        setUp(() {
          when(() => counterRepository.decrease()).thenAnswer((_) async => 0);
        });

        testWidgets(
            'calls counterRepository.decrease when tap on decrease button',
            (tester) async {
          await tester.pumpMaterialApp(widget);

          await tester.tap(decreaseButton);

          verify(() => counterRepository.decrease()).called(1);
          verifyNever(() => counterRepository.reset());
          verifyNever(() => counterRepository.increase());
        });

        testWidgets('renders decrease button with correct parameters',
            (tester) async {
          await tester.pumpMaterialApp(widget);

          final button = tester.widget<CounterButton>(decreaseButton);

          expect(button.icon, Icons.remove);
          expect(button.tooltip, 'Decrease');
          expect(button.backgroundColor, Colors.red);
        });

        testWidgets('renders new value when tap on decrease button',
            (tester) async {
          when(() => counterRepository.value).thenReturn(1);

          await tester.pumpMaterialApp(widget);

          expect(find.text('1'), findsOneWidget);
          expect(find.text('0'), findsNothing);

          await tester.tap(decreaseButton);
          when(() => counterRepository.value).thenReturn(0);
          await tester.pump();

          expect(find.text('1'), findsNothing);
          expect(find.text('0'), findsOneWidget);
        });

        testWidgets(
            'renders CircularProgressIndicator when tap on decrease button',
            (tester) async {
          when(() => counterRepository.decrease()).thenAnswer(
            (_) async => Future.delayed(
              const Duration(milliseconds: 10),
              () => 0,
            ),
          );

          final circularProgressIndicator =
              find.byType(CircularProgressIndicator);
          await tester.pumpMaterialApp(widget);

          expect(circularProgressIndicator, findsNothing);

          await tester.tap(decreaseButton);
          await tester.pump(const Duration(milliseconds: 1));

          expect(circularProgressIndicator, findsOneWidget);

          await tester.pumpAndSettle();

          expect(circularProgressIndicator, findsNothing);
        });
      });

      group('reset', () {
        final resetButton = find.widgetWithIcon(CounterButton, Icons.restore);

        setUp(() {
          when(() => counterRepository.reset()).thenAnswer((_) async => 0);
        });

        testWidgets('calls counterRepository.reset when tap on reset button',
            (tester) async {
          await tester.pumpMaterialApp(widget);

          await tester.tap(resetButton);

          verifyNever(() => counterRepository.decrease());
          verify(() => counterRepository.reset()).called(1);
          verifyNever(() => counterRepository.increase()).called(0);
        });

        testWidgets('renders reset button with correct parameters',
            (tester) async {
          await tester.pumpMaterialApp(widget);

          final button = tester.widget<CounterButton>(resetButton);

          expect(button.icon, Icons.restore);
          expect(button.tooltip, 'Reset');
        });

        testWidgets('renders new value when tap on reset button',
            (tester) async {
          when(() => counterRepository.value).thenReturn(10);

          await tester.pumpMaterialApp(widget);

          expect(find.text('10'), findsOneWidget);
          expect(find.text('0'), findsNothing);

          await tester.tap(resetButton);
          when(() => counterRepository.value).thenReturn(0);
          await tester.pump();

          expect(find.text('10'), findsNothing);
          expect(find.text('0'), findsOneWidget);
        });

        testWidgets(
            'renders CircularProgressIndicator when tap on reset button',
            (tester) async {
          when(() => counterRepository.reset()).thenAnswer(
            (_) async => Future.delayed(
              const Duration(milliseconds: 10),
              () => 0,
            ),
          );

          final circularProgressIndicator =
              find.byType(CircularProgressIndicator);
          await tester.pumpMaterialApp(widget);

          expect(circularProgressIndicator, findsNothing);

          await tester.tap(resetButton);
          await tester.pump(const Duration(milliseconds: 1));

          expect(circularProgressIndicator, findsOneWidget);

          await tester.pumpAndSettle();

          expect(circularProgressIndicator, findsNothing);
        });
      });

      group('increase', () {
        final increaseButton = find.widgetWithIcon(CounterButton, Icons.add);

        setUp(() {
          when(() => counterRepository.value).thenReturn(0);
          when(() => counterRepository.increase()).thenAnswer((_) async => 1);
        });

        testWidgets(
            'calls counterRepository.increase when tap on increase button',
            (tester) async {
          await tester.pumpMaterialApp(widget);

          await tester.tap(increaseButton);

          verifyNever(() => counterRepository.decrease());
          verifyNever(() => counterRepository.reset());
          verify(() => counterRepository.increase()).called(1);
        });

        testWidgets('renders increase button with correct parameters',
            (tester) async {
          await tester.pumpMaterialApp(widget);

          final button = tester.widget<CounterButton>(increaseButton);

          expect(button.icon, Icons.add);
          expect(button.tooltip, 'Increase');
          expect(button.backgroundColor, Colors.green);
        });

        testWidgets('renders new value when tap on increase button',
            (tester) async {
          await tester.pumpMaterialApp(widget);

          expect(find.text('0'), findsOneWidget);
          expect(find.text('1'), findsNothing);

          await tester.tap(increaseButton);
          when(() => counterRepository.value).thenReturn(1);
          await tester.pump();

          expect(find.text('0'), findsNothing);
          expect(find.text('1'), findsOneWidget);
        });

        testWidgets(
            'renders CircularProgressIndicator when tap on increase button',
            (tester) async {
          when(() => counterRepository.increase()).thenAnswer(
            (_) async => Future.delayed(
              const Duration(milliseconds: 10),
              () => 1,
            ),
          );

          final circularProgressIndicator =
              find.byType(CircularProgressIndicator);
          await tester.pumpMaterialApp(widget);

          expect(circularProgressIndicator, findsNothing);

          await tester.tap(increaseButton);
          await tester.pump(const Duration(milliseconds: 1));

          expect(circularProgressIndicator, findsOneWidget);

          await tester.pumpAndSettle();

          expect(circularProgressIndicator, findsNothing);
        });
      });
    });
  });
}
